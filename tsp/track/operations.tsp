import "@typespec/http";
import "../common/error_models.tsp";
import "./models.tsp";

using TypeSpec.Http;

namespace DriftLapseAPI;

@route("/track")
namespace DriftLapseAPI.Track {
    @tag("Track")
    @route("/register")
    interface RegisterTrackPoint {
        /** Register a point to start tracking */
        @summary("Register a track point")
        @returnsDoc("Registered Successfully")
        @post
        registerTrackPoint(@body body: RegisterTrackPointRequest): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...SuccessResponse;
            };
        } | InternalError | APIValidationError;
    }
    
}
