# CleanReportTableDemo
This iOS app demonstrates an architectural solution to a fairly complex banking report scene.

This is a refactoring of the  [ReportTableDemo](https://github.com/lyleresnick/ReportTableDemo) into a VIPER Architecture.

It shows how VIPER can be used to break up a potentially very Massive View Controller by introducing the following classes:

- a Use Case which transforms its input Model to an output protocol -- there are two transformers: one processes data originating from two separate input streams, the other processes data originating from a single stream
- a Presenter, which transforms its input Model (as defined by the output protocol from the Use Case) into a ViewModel. The presenter retains the View Model to act as data source for the TableView 

Note that the view models used here are not the ViewModels implied by the MVVM pattern
