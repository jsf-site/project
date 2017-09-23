---
layout: page
title: Related Specifications
tagline: The JSR
section_id: specification
permalink: related-specifications
image: specification.jpg
avatar: specification-250.jpg
---

There are certain concerns that involve JSF that are too broad to deal with in the JSF specification itself. 
In these cases, related specifications have been introduced that can focus soley on the technology concern. 
Below is a listing of the related JSF specifications and a brief description of their purpose.  

## <a name="TOC-JSR-299"></a>[JSR 299](http://jcp.org/en/jsr/detail?id=299): Java Contexts and Dependency Injection for the Java EE Platform (CDI)  

CDI defines a set of services for Java EE components that provide a type-safe dependency injection facility, 
contextual state management and a lightweight event notification facility. You can read more information about 
it at [http://seamframework.org/Weld](http://seamframework.org/Weld). This specification was introduced to bridge JSF 
and EJB. For that reason, it's **the preferred means of defining managed beans for JSF views**, replacing the managed 
bean facility in the JSF specification. CDI is recommended over JSF managed beans as Facelets is recommended over JSP.  

CDI also defines the conversation scope for JSF. It's defined as a CDI custom scope, not as JSF custom scope. 
The boundaries of a conversation is controlled programmatically using the Conversation API in CDI.

## <a name="TOC-JSR-301"></a>[JSR 301](http://jcp.org/en/jsr/detail?id=301): Portlet Bridge Specification for JavaServer Faces

The Portlet Bridge Specification for JavaServer Faces defines the semantics of a JSR 168/JSR 286 portlet that proxies 
for JSF artifacts. It defines the subsystem that allows a JavaServer Faces resource to execute and satisfy a portlet 
request. The bridge is layered between the portlet container and the JavaServer Faces runtime. Its behavior and 
implementation depends on both.

There is a discrete bridge specification and implementation for each version combination of 
JavaServer Faces and Java Portlets.

## <a name="TOC-JSR-329"></a>[JSR 329](http://jcp.org/en/jsr/detail?id=329): Portlet 2.0 Bridge for JavaServer Faces 1.2 Specification

The compliment specification to JSR 301 that defines the semantics of running a JSF resource in a portlet 2.0 runtime.

## <a name="TOC-JSR-245"></a>[JSR 245](http://jcp.org/en/jsr/detail?id=245): JavaServer Pages 2.1

For historical reasons, part 2 of this specification includes the definition of the Unified Expression Language 
(EL) that JSF heavily relies upon. The Unified EL began as an initiative to better integrate JSF and JSP, but now 
that Facelets is the standard view layer, the Unified EL is often seen as a standalone technology and hopefully it 
will split off as its own specification.</div>

## <a name="TOC-JSR-276"></a>[JSR 276](http://jcp.org/en/jsr/detail?id=276): Design Time Metadata for JavaServer Faces Components

Defines a standard mechanism for associating design-time information with JavaServer Faces components.