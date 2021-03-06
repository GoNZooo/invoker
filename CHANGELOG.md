##Changelog

### v1.0.2 - 21.07.2015
- Fixed re-parenting of objects making it so that not correct object is being referred to anymore
- Made destructive edits close edit-window so that component cannot be edited anymore
- Fixed error that manifested while trying to move a lone row to right/left
- Fixed renaming of sections, re-rendering after renaming
- Fixed ghost rows being added to new sections; new default is no row
- Polish: Made headers for edit-dialog more distinguishable; button vs. row
- Polish: Made button names more descriptive so as to be clearer about intent
- Polish: Use auto-close more liberally when saving changes to components
- Polish: Added font for section labels 

### v1.0.3 - 23.07.2015
- Fixed re-naming of buttons so that it doesn't actually re-create every button in row
- Fixed size of edit-button-dialog being maxed and non-resizable; is now smaller and re-sizable

### v1.0.4 - 27.07.2015
- Fixed problem with re-parenting not being properly reflected in rows' button lists (issues #4 & #5)
- Polish: Added callback for pressing enter in most text-fields to do corresponding actions (modify, add)
  An exception to this is the template-field, as it is for multiple lines and enter should be for linebreaks
- Polish: Bolded section labels

### v1.0.5 - 28.07.2015
- Fix problem with duplicate rows being added when using "save row settings" and adding empty row to section (issue #6)
