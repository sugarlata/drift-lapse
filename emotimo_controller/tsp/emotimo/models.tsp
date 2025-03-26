model Position {
    pan?: integer;
    tilt?: integer;
    slide?: integer;
}

model AbsoluteMoveRequest {
    absolute: Position;
}
model Delta {
    pan?: integer;
    tilt?: integer;
    slide?: integer;
}

model RelativeMoveRequest {
    relative: Position;
}

model MoveResponse {
    position: Position;
}


model ConfigureRequest {
    pulseRate?: integer;
}

model ConfigureResponse {
    pulseRate: integer;
}