import Data.Monoid
import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

srcdir = "src"
cssdir = "css"
theme = "flatly"

main = shakeArgs shakeOptions{shakeFiles="build/_shake"} $ do

  cssdir </> theme <.> "css" %> \out -> do
    let srcfile = srcdir </> "less" </> theme <.> "less"
    need [srcfile]
    cmd "lessc" srcfile out

  "*.html" %> \out -> do
    let  srcfile = srcdir </> (out -<.> "adoc")
         cssfile = "css/flatly.css"
    need [ srcfile, cssfile]
    cmd "asciidoctor" "-a linkcss -a" ("stylesheet=" <> cssfile) srcfile "-o" out

  "html" ~> need [ "page_1.html"
                 , "page_2.html"
                 ]
