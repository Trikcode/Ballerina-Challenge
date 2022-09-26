import ballerina/io;
import ballerina/http;

public function main() {
    // Create a new `http:Client` instance to call the backend services.
    http:Client backendClient = new ("http://localhost:9092");

    // When backendClient->forward() is called, an out-of-the-box `forward` 
    // call will be made to the backend, forwarding the same HTTP method and 
    // inbound request headers as it received.
    var response = backendClient->forward("/get?test=123", request);

    if (response is http:Response) {
        // Send the response back to the client.
        var result = caller->respond(response);
    } else {
        // Send an error back to the client.
        http:Response res = new;
        res.statusCode = 500;
        res.setPayload(<@untainted><string>response.detail()?.message);
        var result = caller->respond(res);
    }
}
