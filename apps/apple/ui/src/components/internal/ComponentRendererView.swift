import SwiftUI

public struct ComponentRendererView<Children: View>: View {
  let children: Children?
  let component: ComponentDefinition?

  public init(json: Data?, children: (() -> Children)? = nil) {
    self.children = children?()

    do {
      if let json {
        component = try JSONDecoder().decode(ComponentDefinition.self, from: json)
      } else {
        component = nil
      }
    } catch let DecodingError.typeMismatch(type, context) {
      print("Type '\(type)' mismatch:", context.debugDescription)
      print("CodingPath: \(context.codingPath)")
      fatalError()
    } catch {
      print("Error", error)
      fatalError()
    }
  }

  public var body: some View {
    if let component {
      ComponentFactory(component: .component(component)).render()
    } else if let children {
      children
    } else {
      ProgressView().scaleEffect(x: 2, y: 2, anchor: .center)
    }
  }
}

struct ComponentRendererView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ComponentRendererView(json: Data("""
      {
          "name": "Login",
          "props": {
              "actionClientUrl": "/accounts",
              "actionIcon": "LOCK",
              "actionLabel": "Enter",
              "actionServerUrl": "https://localhost:8000/accounts",
              "intro": "Welcome to Sneaky Cash, where trust is a commodity as rare as a hidden treasure. Enter at your own discretion",
              "title": "Sneaky Cash"
          }
      }
      """.utf8), children: { Text("LOADING") })
    }.previewDisplayName("Login")

    NavigationStack {
      ComponentRendererView(json: Data("""
      {
          "children": [
              {
                  "children": [
                      {
                          "children": [
                              {
                                  "children": [
                                      {
                                          "name": "Widget",
                                          "props": {
                                              "icon": "ARROW_DOWN",
                                              "label": "Total Debt",
                                              "skeleton": true,
                                              "value": "0 000 kr"
                                          }
                                      }
                                  ],
                                  "name": "ServerContent",
                                  "props": {
                                      "serverUrl": "http://localhost:8000/accounts/totaldebt"
                                  }
                              },
                              {
                                  "children": [
                                      {
                                          "name": "Widget",
                                          "props": {
                                              "icon": "ARROW_UP",
                                              "label": "Total Savings",
                                              "skeleton": true,
                                              "value": "0 000 kr"
                                          }
                                      }
                                  ],
                                  "name": "ServerContent",
                                  "props": {
                                      "serverUrl": "http://localhost:8000/accounts/totalsavings"
                                  }
                              }
                          ],
                          "name": "WidgetListItem"
                      },
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "clientUrl": "/accounts/1234567",
                                      "icon": "CARD",
                                      "label": "Diamond Elite",
                                      "value": "34 830 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "clientUrl": "/accounts/2345678",
                                      "icon": "CARD",
                                      "label": "Platinum Prestige",
                                      "value": "1 200 kr"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Credit Card Accounts"
                          }
                      },
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "clientUrl": "/accounts/3456789",
                                      "icon": "CARD",
                                      "label": "Rainy Day Reserves",
                                      "value": "1 340 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "clientUrl": "/accounts/4567890",
                                      "icon": "CARD",
                                      "label": "Adventure Awaits",
                                      "value": "92 600 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "clientUrl": "/accounts/5678901",
                                      "icon": "CARD",
                                      "label": "Future Home Haven",
                                      "value": "16 300 kr"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Savings Accounts"
                          }
                      }
                  ],
                  "name": "List",
                  "props": {
                      "destinations": [
                          {
                              "children": [
                                  {
                                      "children": [
                                          {
                                              "children": [
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "MONEY",
                                                                  "label": "Debt",
                                                                  "value": "34 830 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "LIMIT",
                                                                  "label": "Interest rate",
                                                                  "value": "50 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Account Information"
                                                      }
                                                  },
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "31 May 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "12 May 2023",
                                                                  "label": "Medical Expense Coverage",
                                                                  "value": "-2 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "9 May 2023",
                                                                  "label": "Withdrawal for Car Repair",
                                                                  "value": "-500 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "30 April 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Transactions"
                                                      }
                                                  }
                                              ],
                                              "name": "List"
                                          }
                                      ],
                                      "name": "Pane",
                                      "props": {
                                          "title": "Diamond Elite"
                                      }
                                  }
                              ],
                              "name": "ServerContent",
                              "props": {
                                  "clientUrl": "/accounts/1234567",
                                  "serverUrl": "http://localhost:8000/accounts/1234567"
                              }
                          },
                          {
                              "children": [
                                  {
                                      "children": [
                                          {
                                              "children": [
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "MONEY",
                                                                  "label": "Debt",
                                                                  "value": "1 200 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "LIMIT",
                                                                  "label": "Interest rate",
                                                                  "value": "10 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Account Information"
                                                      }
                                                  },
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "31 May 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "12 May 2023",
                                                                  "label": "Medical Expense Coverage",
                                                                  "value": "-2 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "9 May 2023",
                                                                  "label": "Withdrawal for Car Repair",
                                                                  "value": "-500 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "30 April 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Transactions"
                                                      }
                                                  }
                                              ],
                                              "name": "List"
                                          }
                                      ],
                                      "name": "Pane",
                                      "props": {
                                          "title": "Platinum Prestige"
                                      }
                                  }
                              ],
                              "name": "ServerContent",
                              "props": {
                                  "clientUrl": "/accounts/2345678",
                                  "serverUrl": "http://localhost:8000/accounts/2345678"
                              }
                          },
                          {
                              "children": [
                                  {
                                      "children": [
                                          {
                                              "children": [
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "MONEY",
                                                                  "label": "Balance",
                                                                  "value": "1 340 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "PERCENT",
                                                                  "label": "Interest rate",
                                                                  "value": "3,40 %"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "NUMBER",
                                                                  "label": "Account number",
                                                                  "value": "3456789"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Account Information"
                                                      }
                                                  },
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "31 May 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "12 May 2023",
                                                                  "label": "Medical Expense Coverage",
                                                                  "value": "-2 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "9 May 2023",
                                                                  "label": "Withdrawal for Car Repair",
                                                                  "value": "-500 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "30 April 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Transactions"
                                                      }
                                                  }
                                              ],
                                              "name": "List"
                                          }
                                      ],
                                      "name": "Pane",
                                      "props": {
                                          "title": "Rainy Day Reserves"
                                      }
                                  }
                              ],
                              "name": "ServerContent",
                              "props": {
                                  "clientUrl": "/accounts/3456789",
                                  "serverUrl": "http://localhost:8000/accounts/3456789"
                              }
                          },
                          {
                              "children": [
                                  {
                                      "children": [
                                          {
                                              "children": [
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "MONEY",
                                                                  "label": "Balance",
                                                                  "value": "92 600 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "PERCENT",
                                                                  "label": "Interest rate",
                                                                  "value": "2,85 %"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "NUMBER",
                                                                  "label": "Account number",
                                                                  "value": "4567890"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Account Information"
                                                      }
                                                  },
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "31 May 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "12 May 2023",
                                                                  "label": "Medical Expense Coverage",
                                                                  "value": "-2 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "9 May 2023",
                                                                  "label": "Withdrawal for Car Repair",
                                                                  "value": "-500 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "30 April 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Transactions"
                                                      }
                                                  }
                                              ],
                                              "name": "List"
                                          }
                                      ],
                                      "name": "Pane",
                                      "props": {
                                          "title": "Adventure Awaits"
                                      }
                                  }
                              ],
                              "name": "ServerContent",
                              "props": {
                                  "clientUrl": "/accounts/4567890",
                                  "serverUrl": "http://localhost:8000/accounts/4567890"
                              }
                          },
                          {
                              "children": [
                                  {
                                      "children": [
                                          {
                                              "children": [
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "MONEY",
                                                                  "label": "Balance",
                                                                  "value": "16 300 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "PERCENT",
                                                                  "label": "Interest rate",
                                                                  "value": "3,05 %"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "icon": "NUMBER",
                                                                  "label": "Account number",
                                                                  "value": "5678901"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Account Information"
                                                      }
                                                  },
                                                  {
                                                      "children": [
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "31 May 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "12 May 2023",
                                                                  "label": "Medical Expense Coverage",
                                                                  "value": "-2 000 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "9 May 2023",
                                                                  "label": "Withdrawal for Car Repair",
                                                                  "value": "-500 kr"
                                                              }
                                                          },
                                                          {
                                                              "name": "DataListItem",
                                                              "props": {
                                                                  "heading": "30 April 2023",
                                                                  "label": "Monthly Savings Contribution",
                                                                  "value": "1 000 kr"
                                                              }
                                                          }
                                                      ],
                                                      "name": "ListSection",
                                                      "props": {
                                                          "title": "Transactions"
                                                      }
                                                  }
                                              ],
                                              "name": "List"
                                          }
                                      ],
                                      "name": "Pane",
                                      "props": {
                                          "title": "Future Home Haven"
                                      }
                                  }
                              ],
                              "name": "ServerContent",
                              "props": {
                                  "clientUrl": "/accounts/5678901",
                                  "serverUrl": "http://localhost:8000/accounts/5678901"
                              }
                          }
                      ]
                  }
              }
          ],
          "name": "Pane",
          "props": {
              "title": "Accounts"
          }
      }
      """.utf8), children: { Text("LOADING") })
    }.previewDisplayName("Accounts")

    NavigationStack {
      ComponentRendererView(json: Data("""
      {
          "children": [
              {
                  "children": [
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "icon": "MONEY",
                                      "label": "Debt",
                                      "value": "34 830 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "icon": "LIMIT",
                                      "label": "Interest rate",
                                      "value": "50 000 kr"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Account Information"
                          }
                      },
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "31 May 2023",
                                      "label": "Monthly Savings Contribution",
                                      "value": "1 000 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "12 May 2023",
                                      "label": "Medical Expense Coverage",
                                      "value": "-2 000 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "9 May 2023",
                                      "label": "Withdrawal for Car Repair",
                                      "value": "-500 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "30 April 2023",
                                      "label": "Monthly Savings Contribution",
                                      "value": "1 000 kr"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Transactions"
                          }
                      }
                  ],
                  "name": "List"
              }
          ],
          "name": "Pane",
          "props": {
              "title": "Diamond Elite"
          }
      }
      """.utf8), children: { Text("LOADING") })
    }.previewDisplayName("Credit Card")

    NavigationStack {
      ComponentRendererView(json: Data("""
      {
          "children": [
              {
                  "children": [
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "icon": "MONEY",
                                      "label": "Balance",
                                      "value": "1 340 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "icon": "PERCENT",
                                      "label": "Interest rate",
                                      "value": "3,40 %"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "icon": "NUMBER",
                                      "label": "Account number",
                                      "value": "3456789"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Account Information"
                          }
                      },
                      {
                          "children": [
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "31 May 2023",
                                      "label": "Monthly Savings Contribution",
                                      "value": "1 000 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "12 May 2023",
                                      "label": "Medical Expense Coverage",
                                      "value": "-2 000 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "9 May 2023",
                                      "label": "Withdrawal for Car Repair",
                                      "value": "-500 kr"
                                  }
                              },
                              {
                                  "name": "DataListItem",
                                  "props": {
                                      "heading": "30 April 2023",
                                      "label": "Monthly Savings Contribution",
                                      "value": "1 000 kr"
                                  }
                              }
                          ],
                          "name": "ListSection",
                          "props": {
                              "title": "Transactions"
                          }
                      }
                  ],
                  "name": "List"
              }
          ],
          "name": "Pane",
          "props": {
              "title": "Rainy Day Reserves"
          }
      }
      """.utf8), children: { Text("LOADING") })
    }.previewDisplayName("Savings Account")

    ComponentRendererView(json: Data("""
    {
        "name": "Widget",
        "props": {
            "icon": "ARROW_DOWN",
            "label": "Total Debt",
            "skeleton": false,
            "value": "34 950 kr"
        }
    }
    """.utf8), children: { Text("LOADING") })
      .previewDisplayName("Total Debt")

    ComponentRendererView(json: Data("""
    {
        "name": "Widget",
        "props": {
            "icon": "ARROW_UP",
            "label": "Total Savings",
            "skeleton": false,
            "value": "110 240 kr"
        }
    }
    """.utf8), children: { Text("LOADING") })
      .previewDisplayName("Total Savings")
  }
}
