import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/versioning";

import "./emotimo/operations.tsp";
import "./gopro/operations.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Versioning;

@service({
    title: "Drift Lapse API",
})
@server("http://localhost:8000", "Local Server")
@doc("This is the drift-lapse backend for controlling GoPro, Image Tracking, and Emotimo.")
@versioned(Versions)
namespace DriftLapseAPI {
    using DriftLapseAPI.Emotimo;
    using DriftLapseAPI.GoPro;
}

enum Versions {
    v1: "v1",
}
