if status is-interactive
    # Commands to run in interactive sessions can go here
set -x JAVA_HOME /usr/lib/jvm/java-23-openjdk/
set -x PATH $JAVA_HOME/bin $PATH
end
