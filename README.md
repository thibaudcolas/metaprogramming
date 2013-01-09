# Métaprogrammation et réflexivité #

Un ensemble d'expériences sur la métaprogrammation et la réfléxivité, réalisées dans différents langages dans le cadre de l'UE éponyme du premier semestre de master 2 AIGLE à l'Université Montpellier 2.

Langages utilisés :  
- CLOS
- Java
- Ruby

## Ruby ##

Ruby est assez intéressant car il implémente nativement la notion de méta-classe (appelées en Ruby singleton classes ou eigenclasses).

- Plus d'informations sur [Wikipedia](https://en.wikipedia.org/wiki/Metaclass).
- Et [encore plus d'informations](http://madebydna.com/all/code/2011/06/24/eigenclasses-demystified.html)
- Ressources sur la [métaprogrammation en Ruby](https://github.com/geetarista/ruby-metaprogramming)

### Singleton ###

Le pattern singleton peut être obtenu de nombreuses façons en Ruby. On présente ici six techniques différentes (bien que certaines soient des variations de la même idée).

Ces six techniques peuvent être retrouvées au fil des [nombreux](https://practicingruby.com/articles/shared/jleygxejeopq) [articles](http://selfless-singleton.rickwinfrey.com/2012/12/19/singleton-pattern-metaprogramming-remix/) sur [le sujet](http://dalibornasevic.com/posts/9-ruby-singleton-pattern-again).

Il est conseillé de parcourir ces six essais du plus simple au plus échevelé :
- singleton-stdlib.rb
- singleton-metaclass.rb
- singleton-attr.rb
- singleton-module.rb
- singleton-object.rb
- singleton-last.rb


