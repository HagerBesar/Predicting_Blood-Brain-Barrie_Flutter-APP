import numpy as np
from flask import Flask, request, jsonify
import pickle
from processing import processing
app = Flask(__name__)

gbc = pickle.load(open('modelGBC.pkl', 'rb'))
log = pickle.load(open('modelLOG.pkl', 'rb'))
Dtree = pickle.load(open('modelDtree.pkl', 'rb'))
svc = pickle.load(open('modelSVC.pkl', 'rb'))
knn = pickle.load(open('modelKNN.pkl', 'rb'))


# To use the predict button in our web-app
@app.route('/api', methods=['GET'])
def predict():
    # For rendering results on HTML GUI
    # int1 = [75.0303497,392.657501,66.6450958,792.212769,352.056915,377.674957,-5.89321756,358.615875,53.8606224,393.56427,0.00755,-0.3241,-9.02472714,0.3141,471.90726,5,43,18,1.8501457,12.424439,3.9820592,1,0,-3.4900601,8.0222301,3,275.36215,391.55707,263.44901,528,30,96,48.829825,31.590175,2.2145,0.428571429,-247.8543351,-246.975186,-246.992635,-248.2096689,-248.4988139,-255.605253,-253.3382431,-253.0190862,-253.4844978,-246.5099139,92]
    # int0=[62.7162399,313.242157,70.6185684,691.892273,270.876312,282.615509,-0.468147367,385.988281,37.4837265,308.750549,-0.03951,-0.35115,-8.480223024,3.8548,438.80634,0,27,12,3.009208,9.4497471,11.327873,5,5,0.31511,5.179162,0,227.46637,242.27084,214.226,261,9,48,29.937895,24.836105,1.5569,0.444444444,-153.3322875,-148.0207072,-148.1265321,-155.4664105,-157.1970934,-155.0945254,-147.5406449,-147.296931,-162.9233206,-166.4860028,S(P(=O)(O)O)CCNCCCN]

    d = {}
    int_features = request.args.getlist('status') or request.form.getlist('status')

    if len(int_features) == 1 and ',' in int_features[0]:
        request_data = separated_features_to_list(int_features[0])
    else:
        request_data = int_features
    print(request_data)
    # request_data =processing(request_data)
    final_features = [np.array(request_data)]
    # print(final_features)
    gbc_predict = int(gbc.predict(final_features))
    log_predict = int(log.predict(final_features))
    Dtree_predict = int(Dtree.predict(final_features))
    svc_predict = int(svc.predict(final_features))
    knn_predict = int(knn.predict(final_features))

    prediction = [gbc_predict, log_predict, Dtree_predict, svc_predict, knn_predict]
    print(prediction)

    prediction_text = []
    for n in prediction:
        prediction_text.append(f"{active(n)}")

    final_result = result(prediction)[0]
    blood = result(prediction)[1]

    print(prediction)
    print(prediction_text)
    print(final_result)

    d['prediction'] = prediction
    d['prediction_text'] = prediction_text
    d['final_result'] = final_result
    d['blood'] = blood

    return d


def active(i):
    if i == 1:
        return "Active"
    elif i == 0:
        return "Not Active"
    else:
        return "wrong prediction"


def result(prediction):
    if prediction.count(1) > prediction.count(0):
        blood = " BLOOD PASS "
        return ["Active (1) ", blood]
    else:
        blood = "BLOOD Not PASS"
        return ["Not Active (0)", blood]


def separated_features_to_list(features):
    result1 = []
    print(features.split(','))
    for val in features.split(','):
        if val:
            try:
                result1.append(float(val))
            except:
                result1.append(f'{val}')

    return result1


if __name__ == "__main__":
    app.run(debug=True)
