import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/versioning";

import "./emotimo/operations.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Versioning;

@service({
    title: "Emotimo Control API",
})
@server("http://raspberrypi.local:8000", "Emotimo Control Server")
@doc("This is the emotimo backend for controlling the TB3.")
@versioned(Versions)
namespace EmotimoControlAPI {
    using EmotimoControlAPI.Emotimo;
}

enum Versions {
    v1: "v1",
}
