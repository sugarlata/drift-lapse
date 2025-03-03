import "@typespec/http";
import "../common/error_models.tsp";
import "./models.tsp";

using TypeSpec.Http;

namespace DriftLapseAPI;

@route("/gopro")
namespace DriftLapseAPI.GoPro {
    @tag("GoPro")
    @route("/photo")
    interface GoProCamera {
        /** Send a BLE command to the GoPro to take a photo */
        @summary("Take a photo")
        @returnsDoc("BLE command sent successfully")
        @post
        photoGoPro(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
            };
        } | InternalError;
    }

    @tag("GoPro")
    @route("/video/start")
    interface GoProStartVideo {
        /** Send a BLE command to the GoPro to start recording a video */
        @summary("Start Video")
        @returnsDoc("BLE command sent successfully")
        @post
        startVideoGoPro(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
            };
        } | InternalError;
    }

    @tag("GoPro")
    @route("/video/stop")
    interface GoProStopVideo {
        /** Send a BLE command to the GoPro to stop recording a video */
        @summary("Stop Video")
        @returnsDoc("BLE command sent successfully")
        @post
        stopVideoGoPro(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
            };
        } | InternalError;
    }

    @tag("GoPro")
    @route("/timelapse/start")
    interface GoProStartTimelapse {
        /** Send a BLE command to the GoPro to start recording a timelapse */
        @summary("Start Timelapse")
        @returnsDoc("BLE command sent successfully")
        @post
        startTimelapseGoPro(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
            };
        } | InternalError;
    }

    @tag("GoPro")
    @route("/timelapse/stop")
    interface GoProStopTimelapse {
        /** Send a BLE command to the GoPro to stop recording a timelapse */
        @summary("Stop Timelapse")
        @returnsDoc("BLE command sent successfully")
        @post
        stopTimelapseGoPro(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
            };
        } | InternalError;
    }
}
