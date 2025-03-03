import "@typespec/http";
import "../common/error_models.tsp";
import "./models.tsp";

using TypeSpec.Http;

namespace DriftLapseAPI;

@route("/drift-lapse")
namespace DriftLapseAPI.Timelapse {
    @tag("Drift-Lapse")
    @route("/start")
    interface StartDriftLapse {
        /** Start a drift lapse - will follow registered point in frame and take a timelapse */
        @summary("Start a drift lapse")
        @returnsDoc("Started successfully")
        @post
        startDriftLapse(): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...SuccessResponse;
            };
        } | InternalError | RejectedError;
    }
    @tag("Drift-Lapse")
    @route("/stop")
    interface StopDriftLapse {
        /** Stop a drift lapse */
        @summary("Stop a drift lapse")
        @returnsDoc("Stopped successfully")
        @post
        stopDriftLapse(): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...SuccessResponse;
            };
        } | InternalError;
    }

    @tag("Track")
    @route("/start-tracking")
    interface StartTrackPoint {
        /** Start tracking a point */
        @summary("Start tracking a point")
        @returnsDoc("Started Successfully")
        @post
        startTrackPoint(): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...SuccessResponse;
            };
        } | InternalError;
    }

    @tag("Track")
    @route("/stop-tracking")
    interface StopTrackPoint {
        /** Stop tracking a point */
        @summary("Stop tracking a point")
        @returnsDoc("Stopped Successfully")
        @post
        stopTrackPoint(): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...SuccessResponse;
            };
        } | InternalError;
    }
}
