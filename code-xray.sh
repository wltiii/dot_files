#!/usr/bin/env bash
#
# Code Xray - Code Analysis based upon Adam Tornhill's "Software Design X-Rays: Fix Technical Debt With Behavioral Code Analysis"
#

### TODO add multiple parameters -> maybe especially for cloc
xrayCode() {
  ARG=$1

  case "${ARG}" in
    "")
      git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r
      ;;
    "log")
      git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r > xray-commit-frequency.log
      ;;
    "top")
      git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r | head -5
      ;;
    "cloc")
      cloc ./ --by-file --csv --quiet
      ;;
    "cloc-top")
      cloc ./ --by-file --csv --quiet --report-file=xray-lines-by-file.csv
      ;;
    *)
      echo -e "Argument ${ARG} is unknown."
      echo
      showHelp
      ;;
  esac
}

showHelp() {
  echo -e "USAGE:"
  echo -e "\tcode-xray.sh <ARG>"
  echo -e "\tZero or one argument must be provided. Valid arguments are:"
  echo -e "\t\t log - Logs all the git controlled files by descending commit frequency."
  echo -e "\t\t top - Lists the top five git controlled files by commit frequency"
  echo -e "\t\t cloc - Counts lines of code. See https://github.com/AlDanial/cloc for further information and installation instructions."
  echo
  echo -e "\tCalling with no arguments runs the default script. This is the same as log without logging."
  echo
  echo -e "This script is meant to encapsulate many of the scripts and tools found in Adam Tornhill's 'Software Design X-Rays: Fix Technical Debt With Behavioral Code Analysis'."
  echo -e "You will need to install other tools to take full advantage:"
  echo -e "\tcloc - See https://github.com/AlDanial/cloc for further information and installation instructions."
  echo -e "\tcloc - See https://github.com/AlDanial/cloc for further information and installation instructions."
}
# process options
#optspec=":hsb:t:v:w:x:"
#while getopts "$optspec" optchar; do
#        case "${optchar}" in
#        #TODO implement long ARGs
#        #   -)
#        #     case ${OPTARG} in
#        #         install)
#        #         build)
#        #         test)
#        #         vcs)
#        #         *)
#        #             if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
#        #                 echo "Unknown option --${OPTARG}" >&2
#        #             fi
#        #             ;;
#          b)
#            BUILD_OPT=$OPTARG
#            ;;
#          t)
#            TEST_OPT=$OPTARG
#            ;;
#          v)
#            VCS_OPT=$OPTARG
#            ;;
#          w)
#            WATCH_OPT=$OPTARG
#            ;;
#          x)
#            TCR_OPT=$OPTARG
#            ;;
#          h)
#            HELP
#            ;;
#          s)
#            show
#            ;;
#          *)
#            echo -e "\nInvalid option '-${optchar}'. See below.\n"
#            echo -e "\nInvalid option '-${optchar}'. See below.\n" &>>./tcrman/tcrman.log
#            HELP
#            ;;
#        esac
#done

#shift $(($OPTIND -1))


ARG=$1

#if [ -z "$ARG" ]; then
#  showHelp
#else
  xrayCode $ARG
#fi