---
layout: page
title: Get Started
tagline: First steps in JavaServer Faces
section_id: get-started
permalink: get-started
image: get-started.jpg
---

The fastest way to get started with a JSF project is to use a [Maven archetype](http://maven.apache.org/plugins/maven-archetype-plugin/). 
There are many available, three of which are highlighted on this page.  

1.  [Standalone JSF 2](http://www.javaserverfaces.com/get-started#TOC-Creating-a-web-project-and-adding-J)
2.  [JSF 2 with CDI (default for the Java EE 6 platform)](http://www.javaserverfaces.com/get-started#TOC-Creating-a-JSF-2-and-CDI-project)
3.  [JSF 2 with Spring](http://www.javaserverfaces.com/get-started#TOC-Creating-a-JSF-2-and-Spring-project)

You are encouraged to study all three options and decide for yourself which one works best for you.  

First, make sure you have [downloaded and installed](http://maven.apache.org/download.html) Maven 2\. Then, proceed 
with the steps below to create a project that uses JSF 2.  

Note: Maven can execute the project on an embedded web container using plugins, so you don't have to grab a standalone 
web container right away. But eventually you will need one. You can use a 
[Java EE application server](http://java.sun.com/javaee/overview/compatibility-javaee5.jsp), a Servlet container 
(such as Tomcat or Jetty), or the [Spring dm Server](http://www.springsource.org/dmserver).  

** Before you Begin: For the purposes of this tutorial, we recommend using either 
[JBoss Tools for Eclipse](http://www.jboss.org/tools), 
[GlassFish Tools Bundle for Eclipse](http://java.sun.com/javaee/downloads/index.jsp), 
or [NetBeans with GlassFish](http://netbeans.org/downloads/).

## Creating a web project and adding JSF 2

1.  Navigate to a folder where you would like to create your new project. 
    (The 'projectname' chosen in the next step will be the name of the root project folder.)  

2.  Type the following command in a terminal. This will create a project using the Maven webapp archetype; be sure 
    to customize the **groupId** and **artifactId** values to match your organization and project name as desired:

        mvn archetype:create -D**groupId**=com.mycompany.projectname -D**artifactId**=projectname -DarchetypeArtifactId=maven-archetype-webapp

3.  Add the JSF dependencies to your Maven POM file, /pom.xml, according to which 
    [JSF implementation](http://www.javaserverfaces.com/download) you choose. The Mojarra implementation is shown here:  

        <repositories>
            <repository>  
                <id>maven2-repository.dev.java.net</id>  
                <name>Java.net Repository for Maven</name>  
                <url>http://download.java.net/maven/2</url>  
            </repository>  
        </repositories>
            
        <dependencies>
            <!-- Option 1: Use if deploying to a Java EE application server (GlassFish, JBoss AS, etc) -->  
            <dependency>  
                <groupId>javax.faces</groupId>  
                <artifactId>jsf-api</artifactId>  
                <version>2.0</version>  
                <scope>provided</scope>  
            </dependency>
           
            <!-- Option 2: Use if deploying to a servlet container (Tomcat, Jetty, etc) -->  
            <dependency>  
                <groupId>com.sun.faces</groupId>  
                <artifactId>jsf-api</artifactId>  
                <version>2.0.2</version>  
                <scope>runtime</scope>  
            </dependency>  
            <dependency>  
                <groupId>com.sun.faces</groupId>  
                <artifactId>jsf-impl</artifactId>  
                <version>2.0.2</version>  
                <scope>runtime</scope>  
            </dependency>
        </dependencies>  
    
        <build>  
            <plugins>  
                <plugin>  
                    <groupId>org.apache.maven.plugins</groupId>  
                    <artifactId>maven-compiler-plugin</artifactId>  
                    <version>2.0.2</version>  
                    <configuration>  
                         <source>1.5</source>  
                         <target>1.5</target>  
                         <encoding>UTF-8</encoding>  
                    </configuration>  
                </plugin>  
            </plugins>  
        </build>


4.  For Eclipse Users: Do not use the New Project wizard. Run the following command, then **import** the root project 
    folder into the Eclipse workspace directly: (File -> Import -> Existing Projects into Workspace)  

        mvn eclipse:eclipse -Dwtpversion=2.0

    This generates Eclipse .project, .settings, and .classpath files for you automatically. After running the command above, 
    the project will be ready for import. **You will need to re-run this command every time the pom.xml file is modified.**  
    
    **For NetBeans/IntelliJ Users:** You should be able to import the project root folder directly, as a Maven project.  

5.  Add the Faces Servlet and mapping to /src/main/webapp/WEB-INF/web.xml:  

        <!DOCTYPE web-app PUBLIC 
          "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"  
          "http://java.sun.com/dtd/web-app_2_3.dtd" >  
            
        <web-app>  
            <display-name>Archetype Created Web Application</display-name>  
    
            <context-param>  
                <param-name>javax.faces.PROJECT_STAGE</param-name>  
                <param-value>Development</param-value>  
            </context-param>  
    
            <servlet>  
                <servlet-name>Faces Servlet</servlet-name>  
                <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>  
            </servlet>  
            <servlet-mapping>  
                <servlet-name>Faces Servlet</servlet-name>  
                <url-pattern>*.jsf</url-pattern>  
            </servlet-mapping>  
    
        </web-app>  

6.  Create your first JSF managed bean: /src/main/java/WelcomeBean.java
        
        import javax.faces.bean.ManagedBean;
            
        @ManagedBean(name = "welcome", eager = true)  
        public class WelcomeBean {
            
            public WelcomeBean() {  
                System.out.println("WelcomeBean instantiated");  
            }  
            public String getMessage() {  
                return "I'm alive!";  
            }  
        }

7.  Create your first view template: /src/main/webapp/home.xhtml  

        <!DOCTYPE html PUBLIC 
          "-//W3C//DTD XHTML 1.0 Transitional//EN" 
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                
            <html xmlns="http://www.w3.org/1999/xhtml">  
                <head>  
                    <title>Hello JSF 2!</title>  
                </head>  
                <body>  
                   #{welcome.message}  
                </body>  
            </html>

8.  Build the project then deploy target/myproject.war to a Java EE application server or Servlet container. 
    (Adjust the scope of the JSF dependencies depending on which environment you are targeting).  

        mvn package

9.  Access http://localhost:8080/projectname/home.jsf (the port will vary depending on your server settings).  

    You should see, "I'm alive!"

    Don't take off yet! In the example above, you'll notice that we're using the **@ManagedBean** annotation from 
    JSF 2 to create the managed bean. If you're targeting the native Java EE 6 platform, you're strongly encouraged 
    to leverage the new platform-wide managed bean and the services provided by JSR-299: Contexts and Dependency 
    Injection for the Java EE platform (CDI).

    Follow the next tutorial to get started with this new stack.


## <a name="TOC-Creating-a-JSF-2-and-CDI-project"></a>Creating a JSF 2 and CDI project

We're going to go back to the top and create a new project that uses both JSF 2 _and_ CDI, this time using an 
archetype prepared by the [Weld community](http://seamframework.org/Documentation/WeldQuickstartForMavenUsers). 
We'll be creating a project that targets a Java EE 6 application server (e.g., GlassFish V3, JBoss AS 6, etc), 
but there is also an archetype for running JSF 2 and CDI and a Servlet container. 
See [this guide](http://seamframework.org/Documentation/WeldQuickstartForMavenUsers) for details.

Let's get started.

1.  Create a project using the weld-jsf-jee-minimal archetype, customizing the groupId and artifactId values to match 
    your organization and project name as desired:<font color="#006000" face="Courier New">  

        mvn archetype:generate -DgroupId=com.mycompany.projectname -DartifactId=projectname 
        -DarchetypeGroupId=org.jboss.weld.archetypes -DarchetypeArtifactId=weld-jsf-jee-minimal 
        -DarchetypeVersion=1.0.0-BETA1

2.  Observe your first CDI bean: /src/main/java/com/mycompany/projectname/HelloWorld.java (portions shown here)  

        import javax.annotation.PostConstruct;
        import javax.enterprise.context.RequestScoped;  
        import javax.inject.Named;  
            
        @Named  
        @RequestScoped  
        public class HelloWorld {  
            private String text = "Hello World!";  
    
            @PostConstruct  
            public void initialize() {  
                System.out.println(HelloWorld.class.getSimpleName() + " was constructed");  
            }  
    
            public String getText() {  
                return text;  
            }  
        }

3.  Observe the home page view template: /src/main/webapp/home.xhtml (portions shown here)  

        <ui:composition xmlns="http://www.w3.org/1999/html"
            xmlns:ui="http://java.sun.com/jsf/facelets"  
            xmlns:f="http://java.sun.com/jsf/core"  
            xmlns:h="http://java.sun.com/jsf/html">  
            <ui:define name="content">  
                <h1>Hello World</h1>  
                <p>Your CDI bean  <code>HelloWorld</code> says <span style="color: blue;">#{helloWorld.text}</span> using the unified EL.</p>  
                ...  
            </ui:define>  
        </ui:composition>

4.  Build and package the project and run it on an embedded version of GlassFish V3:  

        mvn package embedded-glassfish:run

5.  Access [http://localhost:8080/projectname](http://localhost:8080/projectname)  

    You'll see, "Your CDI bean **HelloWorld** says Hello World! using the Unified EL." You'll also find a 
    demonstration of the JSF 2 / Bean Validation integration and links to learn more.  

6.  You can also deploy the archive target/myproject.war to a standalone Java EE 6 application server (Full or Web Profile).  

Don't go yet! Java EE isn't the only target platform that integrates well with JSF 2\. After seeing examples that 
use two platform bean containers, you'll now see how you can alternatively plug JSF 2 into Spring.

## <a name="TOC-Creating-a-JSF-2-and-Spring-project"></a>Creating a JSF 2 and Spring project

Instructions coming soon.

## <a name="TOC-Next-steps:">Next steps</a>:

1.  Check out the JSF tag libraries:  
    [https://javaserverfaces.dev.java.net/nonav/docs/2.0/vdldocs/facelets/index.html](https://javaserverfaces.dev.java.net/nonav/docs/2.0/vdldocs/facelets/index.html)  

2.  Read the JavaDocs:  
    [https://javaserverfaces.dev.java.net/nonav/docs/2.0/javadocs/index.html](https://javaserverfaces.dev.java.net/nonav/docs/2.0/javadocs/index.html)  

3.  Read the Ajax and JS Docs:  
    [https://javaserverfaces.dev.java.net/nonav/docs/2.0/jsdocs/index.html](https://javaserverfaces.dev.java.net/nonav/docs/2.0/jsdocs/index.html)  

4.  Get Plugins: (The plugin listing is currently hosted at JSFCental.com)  
    [http://jsfcentral.com/products/](http://jsfcentral.com/products/)