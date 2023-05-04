# Python libraries

import pandas as pd
import numpy as np
import pickle
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import precision_score, recall_score, accuracy_score

from sklearn.ensemble import GradientBoostingClassifier
from sklearn.model_selection import train_test_split
import warnings
warnings.filterwarnings('ignore')  # ignore warning messages

# Read data
data = pd.read_csv('BrainData.csv')
header = data.columns.tolist()
head = header.copy()
head.remove('Active')
print(data)
# Label Encoder
# convert to number variables
from sklearn.preprocessing import LabelEncoder
lbe=LabelEncoder()
data.mol=lbe.fit_transform(data.mol)

# Def X and Y
y = data.Active
X = data.drop('Active', 1)

# clean data
X.HOMO.replace("NA", np.nan, inplace=True)
X.GapHL.replace("#VALUE!", np.nan, inplace=True)

from sklearn.impute import SimpleImputer
imp = SimpleImputer(missing_values=np.nan, strategy='mean')
imp = imp.fit(X)
X = imp.transform(X)
X = pd.DataFrame(X, columns=head)

# Normalization train data
scaler = StandardScaler()
X = scaler.fit_transform(X)

X = pd.DataFrame(X, columns=head)

# Train_test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)
# train data
# Predictive model : Gradient Boosting

gbc = GradientBoostingClassifier()

gbc = gbc.fit(X_train, y_train)
pickle.dump(gbc, open('modelGBC2.pkl','wb'))

y_pred = gbc.predict(X_test)
AccScore = accuracy_score(y_test, y_pred)
PrecisionScore = precision_score(y_test, y_pred)
RecallScore = recall_score(y_test, y_pred)
F1_score = 2 * (PrecisionScore * RecallScore) / (PrecisionScore + RecallScore)
scoreList=['gbc',AccScore,PrecisionScore,RecallScore,F1_score]
print(scoreList)
#  Predictive model 2 : Logistic Regression

from sklearn.linear_model import LogisticRegression

log = LogisticRegression()

log = log.fit(X_train, y_train)

pickle.dump(log, open('modelLOG2.pkl','wb'))

y_pred = log.predict(X_test)
AccScore = accuracy_score(y_test, y_pred)
PrecisionScore = precision_score(y_test, y_pred)
RecallScore = recall_score(y_test, y_pred)
F1_score = 2 * (PrecisionScore * RecallScore) / (PrecisionScore + RecallScore)
scoreList=['log',AccScore,PrecisionScore,RecallScore,F1_score]
print(scoreList)

# Predictive model 3 : DecisionTree Classifier

from sklearn.tree import DecisionTreeClassifier
Dtree= DecisionTreeClassifier()
Dtree.fit(X_train, y_train)

pickle.dump(Dtree, open('modelDtree2.pkl','wb'))
y_pred = Dtree.predict(X_test)
AccScore = accuracy_score(y_test, y_pred)
PrecisionScore = precision_score(y_test, y_pred)
RecallScore = recall_score(y_test, y_pred)
F1_score = 2 * (PrecisionScore * RecallScore) / (PrecisionScore + RecallScore)
scoreList=['Dtree',AccScore,PrecisionScore,RecallScore,F1_score]
print(scoreList)

# Predictive model 4 : Support Vector Machine(svc) </a>

from sklearn.svm import SVC

svc = SVC()

svc = svc.fit(X_train, y_train)

pickle.dump(svc, open('modelSVC2.pkl','wb'))

y_pred = svc.predict(X_test)
AccScore = accuracy_score(y_test, y_pred)
PrecisionScore = precision_score(y_test, y_pred)
RecallScore = recall_score(y_test, y_pred)
F1_score = 2 * (PrecisionScore * RecallScore) / (PrecisionScore + RecallScore)
scoreList=['svc',AccScore,PrecisionScore,RecallScore,F1_score]
print(scoreList)
# Predictive model 5 : K-Nearest Neighbor(KNN)

from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier()

knn = knn.fit(X_train, y_train)

pickle.dump(knn, open('modelKNN2.pkl','wb'))
y_pred = knn.predict(X_test)
AccScore = accuracy_score(y_test, y_pred)
PrecisionScore = precision_score(y_test, y_pred)
RecallScore = recall_score(y_test, y_pred)
F1_score = 2 * (PrecisionScore * RecallScore) / (PrecisionScore + RecallScore)
scoreList=['knn',AccScore,PrecisionScore,RecallScore,F1_score]
print(scoreList)
