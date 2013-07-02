dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
      dataSource {
          dbCreate = "update"
          driverClassName = "org.postgresql.Driver"
          dialect = org.hibernate.dialect.PostgreSQLDialect
<<<<<<< HEAD
=======
      
          //uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")
          uri = new URI(System.env.DATABASE_URL?:"postgres://postgres:123456@localhost/electronica")

          // dbCreate = "update"
          // driverClassName = "org.postgresql.Driver"
          // dialect = org.hibernate.dialect.PostgreSQLDialect
>>>>>>> 784262c4ac3103c2e2c64a6df97d024870bfe6f5

          //uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")
          uri = new URI(System.env.DATABASE_URL?:"postgres://adnlos:postgres@localhost/electronica")

          url = "jdbc:postgresql://"+uri.host+uri.path
          username = uri.userInfo.split(":")[0]
          password = uri.userInfo.split(":")[1]
      }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
    production {
      dataSource {
          dbCreate = "update"
          driverClassName = "org.postgresql.Driver"
          dialect = org.hibernate.dialect.PostgreSQLDialect

          uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/electronica")

          url = "jdbc:postgresql://"+uri.host+uri.path
          username = uri.userInfo.split(":")[0]
          password = uri.userInfo.split(":")[1]
      }
    }
}
