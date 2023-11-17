package test;

import app.App;
import com.intuit.karate.http.HttpServer;
import com.intuit.karate.http.ServerConfig;
import org.junit.jupiter.api.Test;

class LocalRunner {

    @Test
    void testServer() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer.config(config).http(8088).build().waitSync();
    }        

}
