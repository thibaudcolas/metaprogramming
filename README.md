# Métaprogrammation et réflexivité #

Un ensemble d'expériences sur la métaprogrammation et la réfléxivité, réalisées dans différents langages dans le cadre de l'UE éponyme du premier semestre de master 2 AIGLE à l'Université Montpellier 2.

Langages utilisés :  
- CLOS
- Java
- Ruby

## Tâches ##

- CLOS
- Java
- Ruby
- [X] Réaliser un singleton
- [X] Réaliser une mémo-classe
- [ ] Réaliser un inspecteur
- [ ] Choisir le meilleur singleton
- [ ] Choisir la meilleure mémo-classe
- [ ] Tester l'héritage des singletons et des mémoclasses

## Ruby ##

Ruby est assez intéressant car il implémente nativement la notion de méta-classe (appelées en Ruby _singleton classes_ ou _eigenclasses_).

- [DrX](http://drx.rubyforge.org/), un inspecteur d'objet avec interface graphique
- Plus d'informations sur [Wikipedia](https://en.wikipedia.org/wiki/Metaclass).
- Et [encore plus d'informations](http://madebydna.com/all/code/2011/06/24/eigenclasses-demystified.html).
- Ressources sur la [métaprogrammation en Ruby](https://github.com/geetarista/ruby-metaprogramming).

### Singleton ###

Le pattern singleton peut être obtenu de nombreuses façons en Ruby. On présente ici six techniques différentes (bien que certaines soient des variations de la même idée).

Ces six techniques peuvent être retrouvées au fil des [nombreux](https://practicingruby.com/articles/shared/jleygxejeopq) [articles](http://selfless-singleton.rickwinfrey.com/2012/12/19/singleton-pattern-metaprogramming-remix/) sur [le sujet](http://dalibornasevic.com/posts/9-ruby-singleton-pattern-again).

Il est conseillé de parcourir ces six essais du plus simple au plus échevelé :
1. [singleton-stdlib.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-stdlib.rb)
2. [singleton-metaclass.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-metaclass.rb)
3. [singleton-attr.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-attr.rb)
4. [singleton-module.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-module.rb)
5. [singleton-object.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-object.rb)
6. [singleton-last.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/singleton/singleton-last.rb)

### Mémo-classes ###

Objectif : Définir la classe `memo-class` des classes qui mémorisent leurs instances. Pour simplifier, on pourra lui associer la classe `memo-object` des objets qui sont mémorisés par leur classe.

Les mémo-classes s'approchent du design pattern [Multiton](https://en.wikipedia.org/wiki/Multiton_pattern). En Ruby, on peut les implémenter de différentes manières [plus](http://www.ruby-forum.com/topic/101486) ou [moins](http://stackoverflow.com/questions/6365638/how-to-get-class-instances-in-ruby) propres.

1. [memoclass-attr.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/memoclass/memoclass-attr.rb)
2. [memoclass-module.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/memoclass/memoclass-module.rb)
3. [memoclass-objectspace.rb](https://github.com/ThibWeb/metaprogramming/blob/master/ruby/memoclass/memoclass-objectspace.rb)
