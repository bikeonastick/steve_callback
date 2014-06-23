echo "finding jruby.jar"
ruby_bin=`which ruby`
ruby_loc=`which ruby|sed 's/\(.*\)\/bin\/ruby/\1/'`
jruby_jar_loc="${ruby_loc}/lib/jruby.jar"

if [ -e $jruby_jar_loc ]
  then
    echo "cleaning up, first"
    rm caller.jar
    rm -f *.class
    rm -f MyCallbackJrubyc.java
    rm -f MyCallbackJrubycJavac.java
    
    echo "compile all java files"
    javac -nowarn *.java
    
    echo "jrubyc --java >> produce java MyCallbackJrubycJavac source"
    jrubyc --java MyCallbackJrubycJavac.rb
    
    echo "javac >> compile MyCallbackJrubycJavac"
    echo "found ${jruby_jar_loc} using it to compile"
    javac -cp $jruby_jar_loc MyCallbackJrubycJavac.java
    echo "jrubyc >> compile MyCallbackJrubycJavac"
    jrubyc --javac MyCallbackJrubyc.rb
    
    echo "jar-ing all classfiles"
    jar -cvf caller.jar *.class
    
    echo "clean up after ourselves"
    rm -f *.class
    rm -f MyCallbackJrubyc.java
    rm -f MyCallbackJrubycJavac.java

  else
    echo "jruby.jar not found here: ${jruby_jar_loc}"
fi


