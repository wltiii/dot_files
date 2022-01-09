def d = new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails')
println "the directory exists ${d.exists()}"
def f = new File(d, '01 Who Do You Love (Who|When|Where|How|Which|Who).mp3')
println "the file exists ${f.exists()}"
def created = f.createNewFile()
println "was it created ${created}"
println "the file exists ${f.exists()}"

f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/01 Who Do You Love - Part 1.mp3').bytes
f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/02 When You Love.mp3').bytes
f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/03 Where You Love.mp3').bytes
f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/04 How You Love.mp3').bytes
f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/05 Which Do You Love.mp3').bytes
f << new File('/Users/worldwidewilly/Music/iTunes/iTunes Media/Music/Quicksilver Messenger Service/Happy Trails/06 Who Do You Love - Part 2.mp3').bytes

