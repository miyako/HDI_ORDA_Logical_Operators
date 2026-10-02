# HDI_ORDA_Logical_Operators

![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
![4D](https://img.shields.io/static/v1?label=4D&message=21%2B&color=blue)
![license](https://img.shields.io/github/license/miyako/HDI_ORDA_Logical_Operators)

**How do I use logical operators on entity selections in ORDA?**

A 4D "How Do I" (HDI) example project. It combines two entity selections with `and()`, `or()` and `minus()`, and shows the result next to the operands.

## Features

- Three entity selection operators, each triggered by a button:

| Operator | Button | Result |
|----------|--------|--------|
| `and()` | Students who eat meat AND fish | Intersection of the two selections |
| `or()` | Students who eat meat OR fish | Union of the two selections |
| `minus()` | Students who eat ONLY meat | Entities in the first selection and not in the second |

- Four collection-type list boxes show the whole class, the two source selections and the result.
- A "Trace" check box calls `TRACE` before the operator runs, so you can step through the code.
- A splash form checks the minimum 4D version and any required license before the demo opens.
- Dark mode, macOS Liquid Glass and Windows themes are supported.
- English and Japanese localisation (XLIFF).

## Requirements

- 4D 21 or later (project mode, `compatibilityVersion` 2101)
- macOS or Windows

## Getting started

1. Open `Project/HDI_ORDA_Logical_Operators.4DProject` with 4D.
2. Choose **File > Demo** (Cmd/Ctrl+K), or run `00_Start`.
3. On first launch, empty tables are filled from `Resources/*.4ie` / `*.4si` import files.

## How it works

The business logic is in `initPages`, which builds three entity selections stored in `Form`:

```4d
Form.students:=ds.Student.all()
Form.eatsMeat:=ds.Student.query("food.meat=:1"; "Yes")
Form.eatsFish:=ds.Student.query("food.fish=:1"; "Yes")
```

Each button method then stores the combined selection in `Form.result`, which is the data source of the **Results** list box:

```4d
Form.result:=Form.eatsMeat.and(Form.eatsFish)    // Button3
Form.result:=Form.eatsMeat.or(Form.eatsFish)     // Button5
Form.result:=Form.eatsMeat.minus(Form.eatsFish)  // Button6
```

## Project structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Methods/00_Start.4dm` | Entry point (menu **Demo**, `onStartup`) |
| `Project/Sources/Methods/initPages.4dm` | Builds the ORDA entity selections |
| `Project/Sources/Forms/HDI` | Splash form (version/license check) |
| `Project/Sources/Forms/HDI2` | Demo form (tabs, list boxes, operator buttons) |
| `Project/Sources/TableForms` | Input/output forms for the `INFO` and `Student` tables |
| `Project/Sources/styleSheets*.css` | Dark mode and Liquid Glass styling |
| `Resources/{en,ja}.lproj` | XLIFF localisation files |

## Points of interest

- **Startup pattern.** `00_Start` uses `CALL WORKER` and a non-blocking `DIALOG(...; *)` instead of `New process`. A second call brings the existing splash window to front.
- **State in `Form`.** The trace flag, entity selections and result live in the form object, not in process or interprocess variables.
- **Standard actions.** The Quit menu item uses the `quit` standard action instead of a one-line wrapper method.
- **CSS themes.** `styleSheets.css` defines light/dark colours with `prefers-color-scheme`; `styleSheets_mac.css` sets 27px / 23px push buttons for `liquid-glass` / `mac-classic`.
- **Automatic colours.** List boxes and text use `automatic` / `automaticAlternate`, so they follow the system appearance.
- **Localisation.** Strings come from XLIFF (`:xliff:` in forms and menus, `Localized string` in methods).
- **List box defaults.** Columns use `truncateMode: none`, list boxes use `resizingMode: legacy`.
- **Method visibility.** Subroutines (`initPages`, `RW`) are hidden from the Run Method dialog.

## References

- Blog: [Logical operations on entity selections](https://blog.4d.com/logical-operations-on-entity-selections/)
- Docs: [EntitySelection.and()](https://developer.4d.com/docs/API/EntitySelectionClass#and), [or()](https://developer.4d.com/docs/API/EntitySelectionClass#or), [minus()](https://developer.4d.com/docs/API/EntitySelectionClass#minus)
- Docs: [ORDA](https://developer.4d.com/docs/ORDA/overview), [CSS in 4D](https://developer.4d.com/docs/FormEditor/stylesheets), [Standard actions](https://developer.4d.com/docs/Menus/properties)

## Origin

A 4D v17 HDI binary database, converted to a 4D project with 4D 21 and then modernised.

- Original download: https://download.4d.com/Demos/4D_v17/HDI_ORDA_Logical_Operators.zip

## License

[MIT](LICENSE)
