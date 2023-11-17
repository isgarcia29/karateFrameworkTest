package app.perf

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class secondSimulation extends Simulation {
  
  //Utils.startServer()


  val restful_protocol = karateProtocol(
    "/booking/{id}" -> Nil,
  )

  val restful = scenario("restful-booker").exec(karateFeature("classpath:app/api/simple/restful-booker.feature"))



  setUp(
    restful.inject(atOnceUsers(3)).protocols(restful_protocol)
  )

}