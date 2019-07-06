## Impress them Early

## Tell a Story

"If I stood up and read the entire ECMAScript spec to you, I’d be technically sophisticated but a terrible speaker."

"The truth is that humans are story-driven. Good talks focus on solving problems. Great talks tell stories that change perspectives."

[https://dev.to/samjulien/speaker-stuff-no-one-tells-you-about-applying-to-conferences-l3n](https://dev.to/samjulien/speaker-stuff-no-one-tells-you-about-applying-to-conferences-l3n)

## _Do_ Repeat Yourself

## Limit "Trivia"

* Bad: Who created the Go Language?
* Good: Is Go compiled or interpreted?

## Avoid Ambiguous Pronouns

Bad:

Does "it" refer to Extinguish or Camp? Even a beginner can probably figure it out, but why make them expend the mental effort?

```go
func Camp() error {
	var fire Fire
	fire.Light()
	// All you have to do is defer a call to Extinguish
	// right after you make a call to Light! Extinguish
	// will be called when Camp exits, whether it does
	// so normally or due to an error.
	defer fire.Extinguish()
	return fmt.Errorf("spotted a bear")
	fmt.Println("Toasting marshmallows")
	return nil
}
```

Good: s/it/Camp/

```go
func Camp() error {
	var fire Fire
	fire.Light()
	// All you have to do is defer a call to Extinguish
	// right after you make a call to Light! Extinguish
	// will be called when Camp exits, whether Camp does
	// so normally or due to an error.
	defer fire.Extinguish()
	return fmt.Errorf("spotted a bear")
	fmt.Println("Toasting marshmallows")
	return nil
}
```

## Offer Practice

TODO

## Further Reading

__Efficiency in Learning__, Clarke et al.

Wade Christensen, "A Guide to Better Technical Writing": [https://astuteape.com/writing/a-guide-to-better-technical-writing/](https://astuteape.com/writing/a-guide-to-better-technical-writing/)

## Review These Slides

TODO
