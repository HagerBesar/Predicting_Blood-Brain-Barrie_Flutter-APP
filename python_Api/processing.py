def processing(n):
    import pandas as pd
    from sklearn.preprocessing import StandardScaler
    import numpy as np
    # Read data
    data = pd.read_csv('BrainData.csv')
    data = data.drop('Active', 1)
    head = data.columns.tolist()
    # head = header.copy()
    # head.remove('Active')
    data.loc[len(data.index)] = n

    from sklearn.preprocessing import LabelEncoder
    lbe = LabelEncoder()
    data.mol = lbe.fit_transform(data.mol)
    print(list(data.iloc[-1]))
    # clean data
    data.HOMO.replace("NA", np.nan, inplace=True)
    data.GapHL.replace("#VALUE!", np.nan, inplace=True)
    from sklearn.impute import SimpleImputer
    imp = SimpleImputer(missing_values=np.nan, strategy='mean')
    imp = imp.fit(data)
    data = imp.transform(data)
    data = pd.DataFrame(data, columns=head)
    # n=[37.9795837,169.997406,52.71661,404.245483,139.412445,140.044617,4.29764366,292.944,28.0230923,170.786041,-0.05165,-0.45777,-11.05117499,0,259.09637,0,8,8,4.0203915,7,3.0993681,0,0,-2.6396999,1.992434,0,115.88725,107.23528,170.92,58,9,38,10.108,5.652,0.706,0.333333333,-17.95679188,-17.65209769,-17.65824341,-18.07708874,-18.17377111,-18.63016551,-17.90294279,-17.7271889,-18.05194319,-13.80553872,124]
    # Normalization train data
    scaler = StandardScaler()
    data = scaler.fit_transform(data)

    data = pd.DataFrame(data, columns=head)
    print(list(data.iloc[-1]))
    return list(data.iloc[-1])


# processing(
#     [37.9795837, 169.997406, 52.71661, 404.245483, 139.412445, 140.044617, 4.29764366, 292.944, 28.0230923, 170.786041,
#      -0.05165, -0.45777, -11.05117499, 0, 259.09637, 0, 8, 8, 4.0203915, 7, 3.0993681, 0, 0, -2.6396999, 1.992434, 0,
#      115.88725, 107.23528, 170.92, 58, 9, 38, 10.108, 5.652, 0.706, 0.333333333, -17.95679188, -17.65209769,
#      -17.65824341, -18.07708874, -18.17377111, -18.63016551, -17.90294279, -17.7271889, -18.05194319, -13.80553872,
#      'ClC(F)(F)C(Cl)(F)F'])
