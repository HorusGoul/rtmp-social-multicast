const http = require("http");
const qs = require("querystring");

const port = parseInt(process.env.PORT || "19350", 10);

http
  .createServer((request, response) => {
    console.log("➡️ Incoming request");

    if (request.method !== "POST") {
      return notAllowed();
    }

    let body = "";

    request.on("data", (chunk) => {
      body += chunk;

      if (body.length > 1e6) {
        request.connection.destroy();
      }
    });

    request.on("end", () => {
      try {
        const data = qs.parse(body);

        if (data.name !== process.env.RTMP_SECRET) {
          return notAllowed();
        }

        return accept();
      } catch {
        return notAllowed();
      }
    });

    function notAllowed() {
      response.statusCode = 400;
      response.write("❌");
      response.end();
      console.log("❌ Not allowed");
    }

    function accept() {
      response.statusCode = 200;
      response.write("✅");
      response.end();
      console.log("✅ Allowed");
    }
  })
  .listen(port, () => console.log(`RTMP Auth Server listening on`, port));
