def img_tag(src:, alt:, width:, height:)
  "<img src='#{src}' alt='#{alt}' width='#{width}' height='#{height}'>"
end

puts img_tag(src: "ruby.png", alt: "Ruby", width: 300, height: 300)
