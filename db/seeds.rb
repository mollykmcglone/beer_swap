users = [
  ["Molly", "molly@gmail.com", "password", true],
  ["Maldon", "maldon@gmail.com", "123456", false],
  ["Erik", "erik@gmail.com", "password", false]
]

users.each do |name, email, password, admin|
  User.create( name: name, email: email, password: password, admin: admin )
end

categories = [
  ["Beer", 1],
  ["News", 2],
  ["Members", 3],
  ["Brewing", 4],
]

categories.each do |name, id|
  Category.create( name: name, id: id )
end

posts = [
  ["Happy Hour is almost Here", "Cicero famously orated against his political opponent Lucius Sergius Catilina. Occasionally the first Oration against Catiline is taken for type specimens: Quo usque tandem abutere, Catilina, patientia nostra? Quam diu etiam furor iste tuus nos eludet? (How long, O Catiline, will you abuse our patience? And for how long will that madness of yours mock us?) In 1985 Aldus Corporation launched its first desktop publishing program Aldus PageMaker for Apple Macintosh computers, released in 1987 for PCs running Windows 1.0. Both contained the variant lorem ipsum most common today. Laura Perry, then art director with Aldus, modified prior versions of Lorem Ipsum text from typographical specimens; in the 1960s and 1970s it appeared often in lettering catalogs by Letraset. Anecdotal evidence has it that Letraset used Lorem ipsum already from 1970 onwards, eg. for grids (page layouts) for ad agencies. Many early desktop publishing programs, eg. Adobe PageMaker, used it to create templates. Cicero famously orated against his political opponent Lucius Sergius Catilina. Occasionally the first Oration against Catiline is taken for type specimens: Quo usque tandem abutere, Catilina, patientia nostra? Quam diu etiam furor iste tuus nos eludet? (How long, O Catiline, will you abuse our patience? And for how long will that madness of yours mock us?) In 1985 Aldus Corporation launched its first desktop publishing program Aldus PageMaker for Apple Macintosh computers, released in 1987 for PCs running Windows 1.0. Both contained the variant lorem ipsum most common today. Laura Perry, then art director with Aldus, modified prior versions of Lorem Ipsum text from typographical specimens; in the 1960s and 1970s it appeared often in lettering catalogs by Letraset. Anecdotal evidence has it that Letraset used Lorem ipsum already from 1970 onwards, eg. for grids (page layouts) for ad agencies. Many early desktop publishing programs, eg. Adobe PageMaker, used it to create templates.", 1],
  ["Another test post", "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical; it's not genuine, correct, or comprehensible Latin anymore. While lorem ipsum's still resembles classical Latin, it actually has no meaning whatsoever. As Cicero's text doesn't contain the letters K, W, or Z, alien to latin, these, and others are often inserted randomly to mimic the typographic appearence of European languages, as are digraphs not to be found in the original. Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout.", 2]
]

posts.each do |title, content, category_id|
  Post.create( title: title, user: User.first, content: content, category_id: category_id )
end

styles = ["Porter/Stout", "IPA", "Pale Ale", "Sour", "Hefeweizen", "Lager", "Amber"]

styles.each do |name|
  Style.create( name: name )
end

beers = [
  ["Vanilla Porter", "22 oz. bottles", "Really smooth and tasty porter that I made with real vanilla beans.", 6.50, "2016-09-05", true, ""],

  ["Oatmeal Stout", "growler", "This is a very nice, creamy oatmeal stout.", 7.30, "2016-09-10", true, ""]
]

beers.each do |name, container_type, description, abv, brew_date, homebrew, brewery_name|
  Beer.create( name: name, container_type: container_type, description: description, abv: abv, brew_date: brew_date, homebrew: homebrew, brewery_name: brewery_name, profile: Profile.first, style: Style.first )
end
