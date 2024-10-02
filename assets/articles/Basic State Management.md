---
tags: [flutter, dart, stateful, state_management]
---
###### Separating the UI from the Business Logic
##### Model-view Separation
_Architecturally_ speaking, 
**Models** classes that deal with the data, while **Views** are classes that present data to the screen. A **View** will query a **Model** for meta data (size of an array). 
**Now working with the MasterPlan project**
Notice how the **Model** is immutable.
![simple image](assets/plan.dart.png)
![[plan.dart.png]] ![[task.dart.png]]
![[assets/plan.dart.png]] ![[task.dart.png]]
But the app seem to let the user change the text (description) and the checkbox (complete) at will. 
![[plan_checkbox.png]]
The State of the widgets is owned by the model. The UI will query the model for the most up to date data. The `onChanged` call back takes the new data received from the view and stores it in the model. 
The double dots (..) or the **cascade operator** allows a sequence of operations on the same object. 
![[cascade_op.png]]
The more verbose way of achieving the same result is. ![[verbose_cascade_alt.png]]
Aside, the `List.from()` dart method creates a new list from an existing list. A shallow copy
### `InheritedWidget`
In contrast, `StatelessWidget` and `StatefulWidget` are widgets to configure the UI. `InheritedWidget` only passes data down to its children. This inheritance scheme is the bridge between **view** and **model** layers. 
**Now working from example master_plan_pt2**
`InheritedWidget` and `InheritedNotifier` only pass data down lower in the tree.
```dart
class PlanProvider extends 
	InheritedNotifier<ValueNotifier<Plan>>
```
`PlanProvider` inherits from `InheritedNotifier` (`InheritedNotifier` inherits from `InheritedWidget`) and listens for objects that implement the `Listenable` interface. 
`InheritedNotifier` widgets are generic, so we need to specify the the type, `ValueNotifier<Plan>`. Whenever the `ValueNotifier` changes (the `Plan` changes) `notifyListeners()` is called to update values.
Three main step to use `ValueNotify`:
1. **create**
2. **listen**
3. **update** 
Step 1 - *create*
```dart
ValueNotifier<Plan> planNotifier = 
    PlanProvider.of(context);
```
Step 2 - _listen_
By using the `ValueListenableBuilder` to automatically rebuild the UI when the value changes. 
![[listenableBuilder.png]]
Step 3 - _update_
To update the value of `ValueNotifier`, change the `value` property and this will trigger the `notifyListeners()` method. 
![[notifierUpdate.png]]
##### Providers
Regarding, `plan_provider.dart` file and the static method, `ValueNotifier<Plan>`
![[planProvider.png]]
Static methods can be invoked directly from the class name itself without creating an instance of it. A static field or method is shared by all instances of the class.
`!` is the non-null assertion operator (asserts the previous expression cannot be null). 

---
**Now starting from master_plan_pt3**
### Making the app state visible across multiple screen
"Lift state up" refers to the design best practice of placing `State` objects as high as possible in the widget tree. To make the _Master Plan_ project work across multiple screens the State provider need to be "lifted" closer to the root. 


