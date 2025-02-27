I'm still working on this project. This README is not complete. 

Essentaily this project is an attempt to refactor and simplify the SwiftUI Example for [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx) with a focus on Speech Diarization.

If you clone this project and try to run it. You will have an error because this repo does not have the `onnxruntime` framework. It was too large to push to remote. 
You can download it with,

 `https://github.com/csukuangfj/onnxruntime-libs/releases/download/v1.17.1/onnxruntime.xcframework-1.17.1.tar.bz2` Then extract and copy it to the XCode project.

Alternatively, just clone [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx) and follow these [build instructions](https://k2-fsa.github.io/sherpa/onnx/ios/build-sherpa-onnx-swift.html)




