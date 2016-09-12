# Métaprogrammation et réflexivité #

Un ensemble d'expériences sur la métaprogrammation et la réfléxivité, réalisées dans différents langages dans le cadre de l'UE éponyme du premier semestre de master 2 AIGLE à l'Université Montpellier 2.

Langages utilisés :
- CLOS
- Java
- Ruby
- OpenJava
- Smalltalk

Autres langages possibles :
- Objective-C
- Python
- Javassist
- OpenC++
- Scala

Expérimentations réalisées :
- Design pattern singleton
- Classes qui mémorisent leurs instances (mémo-classes)
- Inspecteur d'objets

## CLOS ##

CLOS (Common Lisp Object System) est un ensemble d'opérateurs pour faire de la programmation orientée objets en Lisp. Ces opérateurs ne sont pas séparés du reste de Common Lisp mais historiquement on les regroupe tout de même.

CLOS et son MOP (MetaObject Protocol) sont un bon terrain pour faire de la métaprogrammation.

- [ANSI Common Lisp](http://www.paulgraham.com/acl.html), Paul Graham

### Singleton ###

En CLOS, la façon la plus simple de créer des singletons est de créer une méta-classe possédant un slot étant l'instance à mémoriser. Cette implémentation est d'ailleurs [très répandue](http://www.tfeb.org/lisp/hax.html#SINGLETON-CLASSES). Les classes singleton n'auront alors plus qu'à définir comme méta-classe la classe des classes qui n'ont qu'une seule instance.

- [singleton-class.lisp](https://github.com/thibaudcolas/metaprogramming/blob/master/clos/singleton/singleton-class.lisp)

### Mémo-classes ###

Objectif : Définir la classe `memo-class` des classes qui mémorisent leurs instances. Pour simplifier, on pourra lui associer la classe `memo-object` des objets qui sont mémorisés par leur classe.

CLOS tire parti des méta-classes pour stocker les instances de chaque classe étant un mémo-object.

- [memoclass.lisp](https://github.com/thibaudcolas/metaprogramming/blob/master/clos/memoclass/memoclass.lisp)

### Inspecteur d'objets ###

Un inspecteur d'objets tire parti du MOP pour afficher des informations sur chaque objet qui lui est donné et parcourir leur hiérarchie.

- [inspector.lisp](https://github.com/thibaudcolas/metaprogramming/blob/master/clos/inspector/inspector.lisp)

## Java ##

En Java, la métaprogrammation se fait par le biais de la librairie standard `java.lang.reflect`. Java n'est pas un langage tourné vers la métaprogrammation, mais grâce à cette API il demeure possible de métaprogrammer.

### Singleton ###

Le design pattern Singleton est très commun en Java, et est par exemple utilisé pour `java.lang.Runtime` ou `java.awt.Desktop`. Si sa mise en place ne nécessite pas d'utiliser la métaprogrammation, il est intéressant de savoir comment l'en protéger : comment empêcher l'utilisation de l'API reflect pour créer deux instances d'un supposé singleton.

On considère donc deux approches : l'une, très simple, permise par les structures [`enum`](http://stackoverflow.com/questions/5735797/is-this-singleton-resistant-to-both-serialization-and-reflection-attacks)) de Java > 1.5, et l'autre [plus classique](http://technonstop.com/java-singleton-reflection-and-lazy-initialization) avec une initialisation tardive et un double verrouillage.

1. [EnumSingleton.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/singleton/EnumSingleton.java)
2. [ClassicSingleton.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/singleton/ClassicSingleton.java)

Tests :

1. [TestEnumSingleton.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/singleton/TestEnumSingleton.java)
2. [TestClassicSingleton.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/singleton/TestClassicSingleton.java)

### Mémo-classes ###

Objectif : Définir la classe `memo-class` des classes qui mémorisent leurs instances. Pour simplifier, on pourra lui associer la classe `memo-object` des objets qui sont mémorisés par leur classe.

- [MemoObject.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/memoclass/MemoObject.java)

### Inspecteur d'objets ###

Affichage des propriétés d'un objet donné, séparant ses attributs hérités de ses attributs introduits, ses méthodes héritées de ses méthodes introduites.

- [Inspector.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/inspector/Inspector.java)
- [Test.java](https://github.com/thibaudcolas/metaprogramming/blob/master/java/inspector/Test.java)

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

1. [singleton-stdlib.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-stdlib.rb)
2. [singleton-metaclass.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-metaclass.rb)
3. [singleton-attr.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-attr.rb)
4. [singleton-module.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-module.rb)
5. [singleton-object.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-object.rb)
6. [singleton-last.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/singleton/singleton-last.rb)

### Mémo-classes ###

Objectif : Définir la classe `memo-class` des classes qui mémorisent leurs instances. Pour simplifier, on pourra lui associer la classe `memo-object` des objets qui sont mémorisés par leur classe.

Les mémo-classes s'approchent du design pattern [Multiton](https://en.wikipedia.org/wiki/Multiton_pattern). En Ruby, on peut les implémenter de différentes manières [plus](http://www.ruby-forum.com/topic/101486) ou [moins](http://stackoverflow.com/questions/6365638/how-to-get-class-instances-in-ruby) propres.

1. [memoclass-attr.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/memoclass/memoclass-attr.rb)
2. [memoclass-module.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/memoclass/memoclass-module.rb)
3. [memoclass-objectspace.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/memoclass/memoclass-objectspace.rb)

### Inspecteur d'objets ###

Objectif : définir une fonction inspect-object qui permette d'afficher le type d'un objet et les noms / valeurs de ses attributs.

En Ruby, toutes les fonctions de base d'un inspecteur d'objet sont définies dès l'origine dans le langage. Il est donc très facile de les réutiliser pour construire en [quelques lignes](https://github.com/seeingidog/deeper) des [inspecteurs d'objet](https://github.com/ongaeshi/rubywho) puissants.

Ici, on définit un module `Inspector` qui affiche toutes sortes d'informations sur un objet donné et qui permet d'en effectuer une copie profonde et de le sérialiser de différentes manières.

1. [xmlserializer.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/inspector/xmlserializer.rb)
2. [example.xml](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/inspector/example.xml)
3. [inspector.rb](https://github.com/thibaudcolas/metaprogramming/blob/master/ruby/inspector/inspector.rb)

## OpenJava ##

[OpenJava](http://www.csg.is.titech.ac.jp/openjava/) (mainteant OJ) est un langage basé sur Java, qui lui ajoute un MOP. OpenJava est relativement ancien (2002), mais son apport au Java vanilla reste toujours intéressant.

Projets liés : [OpenC++](http://www.csg.is.titech.ac.jp/~chiba/openc++.html) et [Javassist](http://www.csg.is.titech.ac.jp/~chiba/javassist/)

### Mémo-classes ###

En OpenJava, les mémo-classes sont simulées en créant une méta-classe qui ajoutera à ses instances un attribut `instances` et une méthode `getInstances`.

1. [MemoClass.oj](https://github.com/thibaudcolas/metaprogramming/blob/master/openjava/memoclass/MemoClass.oj)
2. [Person.oj](https://github.com/thibaudcolas/metaprogramming/blob/master/openjava/memoclass/Person.oj)
3. [Student.oj](https://github.com/thibaudcolas/metaprogramming/blob/master/openjava/memoclass/Student.oj)

## Smalltalk ##

MOP très puissant sur lequel se sont basés Ruby et Objective-C.

### Mémo-classes ###

- [memoclass.st](https://github.com/thibaudcolas/metaprogramming/blob/master/smalltalk/memoclass/memoclass.st)
