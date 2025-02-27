import "@typespec/http";
import "./models.tsp";

using TypeSpec.Http;

namespace DriftLapseAPI;

@route("/turret")
namespace DriftLapseAPI.Turret {
    
    @tag("Turret")
    @route("/move")
    interface MoveOperation {
        @summary("Move the turret")
        @post
        moveTurret(@body body: AbsoluteMoveRequest | RelativeMoveRequest): {
            @bodyRoot response: {
                /** Correct Response */
                @statusCode statusCode: 200;
                ...MoveResponse;
            } | {
                /** Raised when there is an internal error */
                @statusCode statusCode: 500;
                message: string;
            };
        };

    }
}
