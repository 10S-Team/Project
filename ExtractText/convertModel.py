import coremltools
import joblib
model = joblib.load('classify.pkl')
coreml_model = coremltools.converters.sklearn.convert(model)
coreml_model.save('your_model.mlmodel')
