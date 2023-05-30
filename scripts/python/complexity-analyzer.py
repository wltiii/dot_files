#!/usr/bin/env python3
#
# Performs indentation based complexity analysis of source code files
#
import argparse
import ast
import json
import os
import time


DATA_FILE = "complexity_data.json"
DEFAULT_THRESHOLDS = {
    "critical": 1000,
    "high": 500,
    "warning": 200
}
CONFIG_FILE = "complexity_config.json"


def count_indents(file_path):
    with open(file_path, "r") as file:
        source_code = file.read()

    tree = ast.parse(source_code)
    indents = []

    def traverse(node, level=0):
        indents.append(level)
        for child_node in ast.iter_child_nodes(node):
            traverse(child_node, level + 1)

    traverse(tree)

    return indents


def calculate_complexity(indents):
    max_indent = max(indents)
    total_indent = sum(indents)
    average_indent = total_indent / len(indents)

    return {
        "max_indent": max_indent,
        "total_indent": total_indent,
        "average_indent": average_indent,
        "complexity_score": max_indent * total_indent * average_indent
    }


def analyze_source_code(file_path):
    indents = count_indents(file_path)
    complexity = calculate_complexity(indents)

    return complexity


def analyze_project_directory(directory_path, thresholds, file_types):
    results = {}

    # Load previous data
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r") as file:
            results = json.load(file)

    # Analyze source code files
    for root, dirs, files in os.walk(directory_path):
        for file in files:
            file_extension = os.path.splitext(file)[1][1:]  # Get file extension without the dot

            if file_extension in file_types:
                file_path = os.path.join(root, file)
                last_modified = os.path.getmtime(file_path)

                # Compare last modified date with stored data
                if file_path in results and results[file_path]["last_modified"] == last_modified:
                    # Use stored data if the file has not been modified
                    complexity = results[file_path]["complexity"]
                else:
                    # Analyze the file if it has been modified or is new
                    print("-------------------")
                    print(f"- Analyzing: {file_path}")
                    print("-------------------")
                    complexity = analyze_source_code(file_path)

                # Store/update the results with the current last modified date
                results[file_path] = {
                    "complexity": complexity,
                    "last_modified": last_modified
                }

    # Save updated data
    with open(DATA_FILE, "w") as file:
        json.dump(results, file, indent=4)

    return results


def get_configuration():
    configuration = {}

    # Load previous configuration if available
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, "r") as file:
            configuration = json.load(file)

    return configuration


def save_configuration(configuration):
    with open(CONFIG_FILE, "w") as file:
        json.dump(configuration, file, indent=4)


def main():
    parser = argparse.ArgumentParser(description="Analyze the complexity of source code files in a project directory.")
    parser.add_argument("directory_path", help="Path to the project directory")
    parser.add_argument("--critical", type=int, help="Critical complexity score threshold")
    parser.add_argument("--high", type=int, help="High complexity score threshold")
    parser.add_argument("--warning", type=int, help="Warning complexity score threshold")
    parser.add_argument("--save-defaults", action="store_true", help="Save provided thresholds as defaults")
    parser.add_argument("--file-types", nargs="+", default=["py", "java", "kt", "dart", "ts"],
                        help="List of file extensions to analyze (default: py, java, kt, dart, ts)")

    args = parser.parse_args()
    directory_path = args.directory_path

    # Get configuration and update thresholds or file types if provided
    configuration = get_configuration()
    thresholds = {
        "critical": args.critical or configuration.get("critical", DEFAULT_THRESHOLDS["critical"]),
        "high": args.high or configuration.get("high", DEFAULT_THRESHOLDS["high"]),
        "warning": args.warning or configuration.get("warning", DEFAULT_THRESHOLDS["warning"])
    }
    file_types = args.file_types or configuration.get("file_types")

    # Save thresholds as defaults if requested
    if args.save_defaults:
        save_configuration(thresholds)

    # Save file types as defaults if requested
    if args.file_types:
        configuration["file_types"] = args.file_types
        save_configuration(configuration)

    results = analyze_project_directory(directory_path, thresholds, file_types)

    critical_files = []
    high_files = []
    warning_files = []

    # Print search path
    print(f"Searching for source files in: {directory_path}\n")

    # Print summary
    print("Complexity Summary:")
    print("-------------------")
    for file_type in file_types:
        files = []
        threshold_key = f"{file_type}_score_threshold"
        threshold = configuration.get(threshold_key)

        if not threshold:
            continue

        for file_path, data in results.items():
            complexity = data["complexity"]
            last_modified = data["last_modified"]

            last_modified_str = time.ctime(last_modified)
            complexity_score = complexity["complexity_score"]

            if complexity_score >= thresholds["critical"]:
                critical_files.append((file_path, complexity_score, last_modified_str))
            elif complexity_score >= thresholds["high"]:
                high_files.append((file_path, complexity_score, last_modified_str))
            elif complexity_score >= thresholds["warning"]:
                warning_files.append((file_path, complexity_score, last_modified_str))

    # Sort files by complexity score (descending)
    critical_files.sort(key=lambda x: x[1], reverse=True)
    high_files.sort(key=lambda x: x[1], reverse=True)
    warning_files.sort(key=lambda x: x[1], reverse=True)

    # Print summary
    print("-------------------")
    print("Complexity Summary:")
    print("-------------------")
    print(f"Critical Files (Score >= {thresholds['critical']}):")
    for file_path, complexity_score, last_modified_str in critical_files:
        print(f"- File: {file_path}")
        print(f"  Last Modified: {last_modified_str}")
        print(f"  Complexity Score: {complexity_score}")
        print()
    print(f"High Files (Score >= {thresholds['high']}):")
    for file_path, complexity_score, last_modified_str in high_files:
        print(f"- File: {file_path}")
        print(f"  Last Modified: {last_modified_str}")
        print(f"  Complexity Score: {complexity_score}")
        print()
    print(f"Warning Files (Score >= {thresholds['warning']}):")
    for file_path, complexity_score, last_modified_str in warning_files:
        print(f"- File: {file_path}")
        print(f"  Last Modified: {last_modified_str}")
        print(f"  Complexity Score: {complexity_score}")
        print()


if __name__ == "__main__":
    main()
