nb2ipynb = Module[{

  cellF = {
   "cell_type" -> "code",
   "execution_count" -> 1,
   "metadata" -> <||>,
   "outputs" -> {<|"name" -> "stdout",
                   "output_type" -> "stream",
                   "text" -> StringRiffle[ToString /@ {##2}, "\n"]|>},
   "source" -> ToString /@ List @@ HoldForm /@ (#1/.Null -> "\n\n")
  }&,

 ipynbF = {
   "cells" -> cellF @@@ #,
   "metadata" -> {"kernelspec" -> {"display_name" -> "JWLS_2",
                                   "language" -> "text",
                                   "name" -> "jwls_2"},
                  "language_info" -> {"codemirror_mode" -> "mathematica",
                                      "file_extension" -> ".wl",
                                      "mimetype" -> "text/x-mathematica",
                                      "name" -> "WolframScript"}},
   "nbformat" -> 4,
   "nbformat_minor" -> 2
  }&,

 nb = NotebookImport[# _,"FlattenCellGroups" -> False]~
      DeleteCases~ HoldComplete[Null]},

Export[FileBaseName@#<>".ipynb", ipynbF@nb, "JSON"]
]&


