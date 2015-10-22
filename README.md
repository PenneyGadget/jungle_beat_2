# jungle_beat

#### Learning Goals / Areas of Focus

* Practice breaking a program into logical components
* Distinguishing between classes and instances of those classes
* Understanding how linked lists work to store and find data
* Testing components in isolation and in combination
* Base Expectations

Then we'll exercise the functionality from a Pry session:

jb = JungleBeat.new("deep dep dep deep")
jb.play
4 # also plays the sounds
jb.append("deep bop bop deep")
4
jb.all
"deep dep dep deep deep bop bop deep"
jb.prepend("tee tee tee tee")
4 # number of beats inserted
jb.all
"tee tee tee tee deep dep dep deep deep bop bop deep"
jb.include?("dep")
true
jb.pop(4)
"deep bop bop deep"
jb.all
"tee tee tee tee deep dep dep deep"
jb.count
8
jb.insert(4, "boop bop bop boop")
"tee tee tee tee boop bop bop boop deep dep dep deep"
jb.find(8, 2)
"deep dep"

#### Internal Structure

You must use a Linked List to store your beats. Each node should contain only a single "word"/beat. You'll want to implement at least each of the following features for your list:

* append an element to the end of the list
* prepend an element at the beginning of the list
* insert one or more elements at an arbitrary position in the list
* includes? gives back true or false whether the supplied value is in the list
* pop one or more elements from the end of the list
* count the number of elements in the list
* find one or more elements based on arbitrary positions in the list. The first parameter indicates the first   position to return and the second parameter specifies how many elements to return.
* all return all elements in the linked list in order
 

#### Extensions

1. Validating Beats

There are a lot of words which aren't going to work for beats. Like Mississippi.

Add validation to your program such that the input beats must be members of your defined list. Insertion of a beat not in the list is rejected. Like this:

jb = JungleBeat.new("deep")
jb.append("Mississippi")
0
jb.all
"deep"
jb.prepend("tee tee tee Mississippi")
3 # number of beats successfully inserted
jb.all
"tee tee tee deep"
Here's a starter list of valid beats, but add more if you like:
tee dee deep bop boop la na


2. Speed & Voice

Let's make it so the user can control the voice and speed of playback. Originally we showed you to use say -r 500 -v Boing where r is the rate and v is the voice. Let's setup a usage like this:

jb = JungleBeat.new("deep dop dop deep")
jb.play
4 # plays the four sounds normal speed with Boing voice
jb.rate = 100
100
jb.play
4 # plays the four sounds slower with Boing voice
jb.voice = "Alice"
"Alice"
jb.play
4 # plays the four sounds slower with Alice voice
jb.reset_rate
500
jb.reset_voice
"Boing"
jb.play
4 # plays the four sounds normal speed with Boing voice

