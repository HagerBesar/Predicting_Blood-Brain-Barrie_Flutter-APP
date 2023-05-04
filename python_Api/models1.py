# Python libraries
from typing import Union, Any

import pandas as pd
import numpy as np
import pickle
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import precision_score, recall_score, confusion_matrix, roc_curve, precision_recall_curve, accuracy_score
#get_ipython().run_line_magic('matplotlib', 'inline')
# from pandas import Series, DataFrame
# from pandas.io.parsers import TextFileReader
# from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.model_selection import train_test_split
import warnings
warnings.filterwarnings('ignore')  # ignore warning messages

# Read data
data = pd.read_csv('BrainData.csv')
data =data.drop('mol',1)
header = data.columns.tolist()

head = header.copy()
head.remove('Active')


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
# scaler = StandardScaler()
# X = scaler.fit_transform(X)
#
# X = pd.DataFrame(X, columns=head)
# Train_test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

# Predictive model : Gradient Boosting

gbc = GradientBoostingClassifier()

gbc = gbc.fit(X_train, y_train)
pickle.dump(gbc, open('modelGBC.pkl','wb'))

#  Predictive model 2 : Logistic Regression

from sklearn.linear_model import LogisticRegression

log = LogisticRegression()

log = log.fit(X_train, y_train)

pickle.dump(log, open('modelLOG.pkl','wb'))


# Predictive model 3 : Voting Classifier

from sklearn.ensemble import VotingClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB

Dtree = DecisionTreeClassifier()

Dtree.fit(X_train, y_train)

pickle.dump(Dtree, open('modelDtree.pkl','wb'))


# Predictive model 4 : Support Vector Machine(svc) </a>

from sklearn.svm import SVC

svc = SVC()

svc = svc.fit(X_train, y_train)

pickle.dump(svc, open('modelSVC.pkl','wb'))


# Predictive model 5 : K-Nearest Neighbor(KNN)

from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier()

knn = knn.fit(X_train, y_train)

pickle.dump(knn, open('modelKNN.pkl','wb'))
