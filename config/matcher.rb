match(/tweet/, ":) Someone just tweeted!").
  play("bird_1.aiff")

match(/signup/, ":) Someone just signed up!").
  play("bird_2.aiff")

match(/invite/, ":) Someone just sent an invite!").
  play("bird_3.aiff")

match(/login/, ":) Someone just logged in!").
  play("bird_4.aiff")

match(/error/, ":( Something bad happened!").
  play("cat.aiff")
