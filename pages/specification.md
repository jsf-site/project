---
layout: section
title: Specification
tagline: The JSR Specification
section_id: specification
permalink: specification
image: specification.jpg
---

JSF is _unlike_ other web frameworks because it's not a library, but rather a specification for a library. It's 
developed in the [Java Community Process](http://jcp.org/) (JCP) and included in the Java EE platform of specifications. 
Currently, it's being worked on as [Java Specification Request (JSR) 314](http://jcp.org/en/jsr/detail?id=314), 
though the foundation was laid for JSF in [JSR-127](http://jcp.org/en/jsr/detail?id=127) and later improved on in 
[JSR-252](http://jcp.org/en/jsr/detail?id=252).  

**_So where's the code?_** Well, the nice part about a specification is that anyone can produce an implementation of 
it and call it "JavaServer Faces". Actually, to be more precise, the implementation must follow the specification 
and pass the JSR-314 Technology Compatibility Kit (TCK). But that is for the implementer to worry about. 
You just look for projects that are _JSF implementations_.  

Every Java EE specification must have at least one reference implementation. For JSF, that's 
[Mojarra](http://javaserverfaces.dev.java.net/). Apache also has an implementation of JSF called 
[MyFaces](http://myfaces.apache.org/). You can use either implementation and expect the same consistent behavior 
as defined by the specification. The specification can't dictate how well an implementation performs, though. 
That's for you to judge!