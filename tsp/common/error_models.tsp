import "@typespec/http";

using TypeSpec.Http;

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
