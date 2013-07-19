game "LoneStarRuby Conference"

players "Avdi", "Dave", "Steve"

rewards 200, 400, 600, 800, 1_000

category "People & History"
answer <<END_ANSWER, <<END_QUESTION
These were the first two books published about Ruby in English.
END_ANSWER
What are _Programming Ruby_ and _The Ruby Way_?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
August 19th, 2009.
END_ANSWER
What day did _Why the Luck Stiff_ withdraw from the Ruby community?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
He holds the "all time" record for Rails commits, ahead of David Heinemeier Hansson, Aaron Patterson, more.
END_ANSWER
Who is Jeremy Kemper?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
Before his death, he used his knowledge of Ruby's internals to answer, primarily in Ruby, questions on mailing lists.
END_ANSWER
Who was Guy Decoux?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This name was rejected, in favor of "Ruby," during a chat session between Yukihiro Matsumoto and Keiju Ishitsuka in 1993.
END_ANSWER
What is "Coral?"
END_QUESTION

category "Syntax"
answer <<END_ANSWER, <<END_QUESTION
The company named after this operator will be pleased to hear that the rumors of its death in Ruby 1.9 are exaggerated.
END_ANSWER
What is the "Hashrocket" (`=>`)?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This operator was added to support method-like parameters, but it stayed in Ruby even after block parameters were enhanced.
END_ANSWER
What is the Arrow Operator or "Stabby Lambda" (`->() { }`)?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This abuse of another operator is generally relegated to scripting hacks that involve quick and dirty filtering of data.
END_ANSWER
What is the "Flip-flop" Operator (`..` or `...`)?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
These expressions have an implicit `.to_s` tacked onto their result.
END_ANSWER
What is interpolation (`"\#{}"`)?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This character is the only way to define a parameter list that accepts multiple arguments but sets no local variables.
END_ANSWER
What is the asterisk or "Naked Splat" (`*`)?
END_QUESTION

category "Core Methods"
answer <<END_ANSWER, <<END_QUESTION
This mix-in isn't as popular as `Enumerable`, but it does add several methods for ordering objects.
END_ANSWER
What is `Comparable`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This iterator was added as an alternative to `inject()` when the same object is always returned from the block.
END_ANSWER
What is#{' ' * 2}
`Enumerable#
each_with_object()`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This method flips some common iterators from greedy to conservative allowing for the construction of infinite data pipelines.
END_ANSWER
What is `Enumerable#lazy()`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This method, recently added to `Array` and `Range`, has the potential to speed up some very large data traversals.
END_ANSWER
What is `bsearch()`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This method removes the need to roll you own or load `WEBrick` just to steal a bit of code, both common in earlier days.
END_ANSWER
What is `Process.daemon()`?
END_QUESTION

category "Standard Library"
answer <<END_ANSWER, <<END_QUESTION
This library gives Ruby's cryptic global variables much more readable names.
END_ANSWER
What is `English`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This library can be used to generate random bytes, strings of hexidecimal characters, UUID's, and more.
END_ANSWER
What is `SecureRandom`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This library gave user level access to Ruby's parser.
END_ANSWER
What is `Ripper`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
It got considerably easier to get the size of the terminal Ruby is running in when this standard library was added.
END_ANSWER
What is `io/console`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
Though not its primary purpose, this library gives us a great one-liner for launching a Web server.
END_ANSWER
What is `un`?
END_QUESTION

category "Rails"
answer <<END_ANSWER, <<END_QUESTION
This is the only command you don't need to prefix with `bundle exec`.
END_ANSWER
What is `rails`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
If you had a JavaScript event trigger in your application that is misbehaving after the 4.0 upgrade, this new feature may be to blame.
END_ANSWER
What is `turbolinks`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This routing feature can restrict matches to requests on a specified subdomain or using a given protocol.
END_ANSWER
What are "constraints?"
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This no-longer-documented automation will reverse then reapply the last set of database schema changes.
END_ANSWER
What is `rake db:migrate:redo`?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This rarely seen flag to the association macros gives Rails the hint to reuse an in-memory Ruby instance.
END_ANSWER
What is `:inverse_of`?
END_QUESTION

category "Off-topic"
answer <<END_ANSWER, <<END_QUESTION
It dictates that there can be no interference with the internal development of alien civilizations.
END_ANSWER
What is "The Prime Directive?"
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
Though their motto is "Live Music Capital of the World," this city hosts a yearly Ruby conference.
END_ANSWER
What is Austin, TX?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This is the technique of partially cooking food so that it can be finished later.
END_ANSWER
What is par-cooking?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
Humans share about 60% of their DNA with this common food item.
END_ANSWER
What is a banana?
END_QUESTION
answer <<END_ANSWER, <<END_QUESTION
This parenting practice aims to send the message that all feelings are okay, even the worst ones.
END_ANSWER
What is Emotion Coaching?
END_QUESTION
