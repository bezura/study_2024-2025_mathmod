from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import classification_report, accuracy_score
import matplotlib.pyplot as plt

# Загрузка данных
data = load_iris()
X, y = data.data, data.target
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

# Обучение дерева решений (критерий — энтропия, max_depth=3)
clf = DecisionTreeClassifier(
    criterion='entropy', max_depth=3, random_state=42
)
clf.fit(X_train, y_train)

# Визуализация структуры дерева
plt.figure(figsize=(8, 6))
plot_tree(
    clf,
    feature_names=data.feature_names,
    class_names=data.target_names,
    filled=True,
    rounded=True
)
plt.title("Обученное дерево решений (глубина 3)")
plt.savefig("image/1.png")
plt.close()

# Оценка качества
y_pred = clf.predict(X_test)
print(classification_report(y_test, y_pred))
acc = accuracy_score(y_test, y_pred)
print(f"Accuracy: {acc:.2f}")

# Зависимость точности от глубины дерева
depths = list(range(1, 11))
accuracies = []
for d in depths:
    model = DecisionTreeClassifier(max_depth=d, random_state=42)
    model.fit(X_train, y_train)
    accuracies.append(model.score(X_test, y_test))

plt.figure()
plt.plot(depths, accuracies, marker='o')
plt.title("Зависимость точности от глубины дерева")
plt.xlabel("Глубина дерева")
plt.ylabel("Accuracy")
plt.savefig("image/2.png")
plt.close()