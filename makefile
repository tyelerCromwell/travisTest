#
# makefile 
#
# input file for 'make' build tool ( /usr/bin/make )
# to build solution for JUnit sample
#
# @author Dr. Fenwick
# @version Summer 2018
#

JUNIT4_JAR = /usr/share/java/junit-4.10.jar
JUNIT4_RUNNER = org.junit.runner.JUnitCore 
HAMCREST_JAR = /usr/share/java/hamcrest/core-1.1.jar
JUNIT5_JAR = junit-platform-console-standalone-1.2.0.jar 
JUNIT5_RUNNER = org.junit.platform.console.ConsoleLauncher
CKSTYLE_COMMAND =  -jar /usr/local/checkstyle-5.5/checkstyle-5.5-all.jar
CKSTYLE_XML = cs_appstate_checks.xml

default: 
	@echo "usage: make target"
	@echo "example: make help"
	@echo "example: make targetlist"
help:
	@echo "Just starting with make? Try these 4 make commands successively:"
	@echo "________ make clean ; make compile ; make test ; make defchk"
targetlist:
	@echo "7 available targets: clean - removes editor tmpfiles and .class files"
	@echo "____________________ compile, test - builds JUnit5 tests, runs all (4 and 5)"
	@echo "____________________ compile4, test4 - builds/runs JUnit4 tests"
	@echo "____________________ defchk, customchk - default or custom checkstyle"

# makefile syntax
#target-name: files dependent on (can use multiple lines by ending
#             lines with \
#<TAB char>Unix command-line command
#<TAB char>Unix command-line command
#etc.
#Essential that command lines start with single TAB character

compile4: Calculator.java Calculator4Test.java \
          $(JUNIT4_JAR)
	javac -cp .:$(JUNIT4_JAR) Calculator4Test.java
	javac Calculator.java

compile: Calculator.java Calculator5Test.java $(JUNIT5_JAR)
	javac -cp .:$(JUNIT5_JAR) Calculator5Test.java
	javac Calculator.java

clean:
	rm -f *~
	rm -f Calculator*.class

test4: Calculator.class Calculator4Test.class 
	java -cp .:$(JUNIT4_JAR):$(HAMCREST_JAR) $(JUNIT4_RUNNER) Calculator4Test

test: $(JUNIT5_JAR)
	java -cp .:$(JUNIT5_JAR) $(JUNIT5_RUNNER) --scan-class-path 

defchk: Calculator.java $(CKSTYLE_XML)
#	checkstyle Calculator.java
	java $(CKSTYLE_COMMAND) -c $(CKSTYLE_XML) Calculator.java

customchk: Calculator.java style.xml
	java $(CKSTYLE_COMMAND) -c style.xml Calculator.java

style.xml:
	@echo "Custom checkstyle needs a local style.xml file."
	@echo "Copy cs_appstate_checks.xml into style.xml and edit as needed."
	@echo "--------------------------------------------------------------"

