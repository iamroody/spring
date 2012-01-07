repositories.remote << 'http://repo1.maven.org/maven2'

SPRING_VERSION = '3.1.0.RELEASE'

SPRING = struct(
    :core => group('spring-core', 'spring-beans', 'spring-context', 'spring-context-support', :under=>"org.springframework", :version=>SPRING_VERSION),
    :asm => "org.springframework:spring-asm:jar:#{SPRING_VERSION}",
    :expression => "org.springframework:spring-expression:jar:#{SPRING_VERSION}",
    :jdbc => transitive("org.springframework:spring-jdbc:jar:#{SPRING_VERSION}"),
    :mvc => transitive("org.springframework:spring-webmvc:jar:#{SPRING_VERSION}"),
    :test => "org.springframework:spring-test:jar:#{SPRING_VERSION}"
)
