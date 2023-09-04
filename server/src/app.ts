import cors from "cors"
import express, { Application, Request, Response } from "express"
import {
  showAccount,
  showAccounts,
  showLogin,
  showTotalDebt,
  showTotalSavings,
} from "./controller/controller"

const app: Application = express()
app.use(cors())

app.get("/login", async (_: Request, res: Response) => {
  res.json(await showLogin())
})

app.get("/accounts", async (_: Request, res: Response) => {
  res.json(await showAccounts())
})

app.get("/accounts/totaldebt", async (_: Request, res: Response) => {
  res.json(await showTotalDebt())
})

app.get("/accounts/totalsavings", async (_: Request, res: Response) => {
  res.json(await showTotalSavings())
})

app.get("/accounts/:accountNumber", async (req: Request, res: Response) => {
  res.json(await showAccount(req.params["accountNumber"] ?? ""))
})

app.listen(8000, () => {})
