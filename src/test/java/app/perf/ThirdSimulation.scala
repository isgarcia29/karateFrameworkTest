package app.perf

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class ThirdSimulation extends Simulation {
  
  //Utils.startServer()

  val protocol = karateProtocol(
    "/api/todos/{id}" -> Nil,
  )



  val json = scenario("jsonplace").exec(karateFeature("classpath:app/api/simple/jsonplace.feature"))



  setUp(
    json.inject(constantUsersPerSec(5).during(15)).protocols(protocol),
  )

}