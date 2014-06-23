# Response to e-mail about jruby and reflection

[ In his e-mail to jruby-user ]( http://markmail.org/message/eom22fof25t4wyu4 ), [boberetezeke](https://gist.github.com/boberetezeke) was asking about differences between `jrubyc` and `jrubyc --java` followed by compiling.

I think I found his issue. I took his [gist from here](https://gist.github.com/boberetezeke/ba919d3e45fca0f18a2d) and added some scripting.

# How to...

This assumes you have installed jruby with rvm and have a jdk installed. All you should have to do is clone this repo, cd into this directory, and follow rvm install instructions. Once jruby is set up, just run:

     ./cmp_cc.sh
     ruby caller_test.rb

# License

[MIT license](http://opensource.org/licenses/MIT)... no warranty
