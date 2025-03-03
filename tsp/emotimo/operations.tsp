import "@typespec/http";
import "./models.tsp";

using TypeSpec.Http;

namespace DriftLapseAPI;

@route("/emotimo")
namespace DriftLapseAPI.Emotimo {
    @tag("Emotimo")
    @route("/absolute")
    interface AbsoluteOperation {
        /** Send a request to move the Emotimo to an absolute position */
        @summary("Move the emotimo to an absolute position")
        @returnsDoc("Operation completed successfully, returns the new absolute position")
        @post
        absMoveEmotimo(@body body: AbsoluteMoveRequest):
            | {
                  @bodyRoot response: {
                      @statusCode statusCode: 200;
                      ...MoveResponse;
                  };
              }
            | RejectedError
            | APIValidationError
            | InternalError;
    }

    @tag("Emotimo")
    @route("/relative")
    interface RelativeOperation {
        /** Send a request to move the Emotimo by a reletive or delta amount */
        @summary("Move the emotimo by a relative amount")
        @returnsDoc("Operation completed successfully, returns the new absolute position")
        @post
        relMoveEmotimo(@body body: RelativeMoveRequest):
            | {
                  @bodyRoot response: {
                      @statusCode statusCode: 200;
                      ...MoveResponse;
                  };
              }
            | RejectedError
            | APIValidationError
            | InternalError;
    }

    @tag("Emotimo")
    @route("/configure")
    interface ConfigureOperation {
        /** Configure the Emotimo operation */
        @summary("Configure the emotimo")
        @returnsDoc("Operation completed successfully")
        @post
        configureEmotimo(@body body: ConfigureRequest):
            | {
                  @bodyRoot response: {
                      @statusCode statusCode: 200;
                      ...ConfigureResponse;
                  };
              }
            | RejectedError
            | APIValidationError
            | InternalError;
    }

    @tag("Emotimo")
    @route("/calibrate")
    interface CalibrateOperation {
        /** Calibrates the Emotimo positions. Whatever the current positions are, they are now labelled 0. */
        @summary("Calibrate the Emotimo")
        @returnsDoc("Operations completed successfully")
        @post
        CalibrateEmotimo(@body body: {}): {
            @bodyRoot response: {
                @statusCode statusCode: 200;
                ...MoveResponse;
            };
        } | APIValidationError | InternalError;
    }
}

/** There was an issue that rejected this operation. See schema for details */
@error
model RejectedError {
    @statusCode statusCode: 400;
    code: "MISSING_FIELD";
    detail: string;
    body: string;
}

/** There was an issue parsing the response. Generated automagically by Pydantic */
@error
model APIValidationError {
    @statusCode statusCode: 422;
    detail: string;
    body: string;
}

/** Something went wrong with processing the request */
@example(#{
    statusCode: 500,
    code: "INTERNAL_ERROR",
    body: "There was an internal error processing the request",
    detail: "A lot of detail to help traceback the error",
})
@error
model InternalError {
    @statusCode statusCode: 500;
    code: "INTERNAL_ERROR";
    body: string;
    detail: string;
}
