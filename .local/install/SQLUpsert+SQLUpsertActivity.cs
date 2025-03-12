using System;
using System.Activities;
using UiPath.CodedWorkflows;
using UiPath.CodedWorkflows.Utils;
using System.Runtime;

namespace GarminConnectSync
{
    [System.ComponentModel.Browsable(false)]
    public class SQLUpsertActivity : System.Activities.Activity
    {
        public InArgument<System.Data.DataTable> dtInsert { get; set; }

        public InArgument<System.String> tableName { get; set; }

        public OutArgument<System.Data.DataTable> Output { get; set; }

        public SQLUpsertActivity()
        {
            this.Implementation = () =>
            {
                return new SQLUpsertActivityChild()
                {dtInsert = (this.dtInsert == null ? (InArgument<System.Data.DataTable>)Argument.CreateReference((Argument)new InArgument<System.Data.DataTable>(), "dtInsert") : (InArgument<System.Data.DataTable>)Argument.CreateReference((Argument)this.dtInsert, "dtInsert")), tableName = (this.tableName == null ? (InArgument<System.String>)Argument.CreateReference((Argument)new InArgument<System.String>(), "tableName") : (InArgument<System.String>)Argument.CreateReference((Argument)this.tableName, "tableName")), Output = (this.Output == null ? (OutArgument<System.Data.DataTable>)Argument.CreateReference((Argument)new OutArgument<System.Data.DataTable>(), "Output") : (OutArgument<System.Data.DataTable>)Argument.CreateReference((Argument)this.Output, "Output")), };
            };
        }
    }

    internal class SQLUpsertActivityChild : UiPath.CodedWorkflows.AsyncTaskCodedWorkflowActivity
    {
        public InArgument<System.Data.DataTable> dtInsert { get; set; }

        public InArgument<System.String> tableName { get; set; }

        public OutArgument<System.Data.DataTable> Output { get; set; }

        public System.Collections.Generic.IDictionary<string, object> newResult { get; set; }

        public SQLUpsertActivityChild()
        {
            DisplayName = "SQLUpsert";
        }

        protected override async System.Threading.Tasks.Task<Action<AsyncCodeActivityContext>> ExecuteAsync(AsyncCodeActivityContext context, System.Threading.CancellationToken cancellationToken)
        {
            var var_dtInsert = dtInsert.Get(context);
            var var_tableName = tableName.Get(context);
            var codedWorkflow = new global::GarminConnectSync.SQLUpsert();
            CodedWorkflowHelper.Initialize(codedWorkflow, new UiPath.CodedWorkflows.Utils.CodedWorkflowsFeatureChecker(new System.Collections.Generic.List<string>()
            {UiPath.CodedWorkflows.Utils.CodedWorkflowsFeatures.AsyncEntrypoints}), context);
            var result = await System.Threading.Tasks.Task.Run(() => CodedWorkflowHelper.RunWithExceptionHandlingAsync(() =>
            {
                if (codedWorkflow is IBeforeAfterRun codedWorkflowWithBeforeAfter)
                {
                    codedWorkflowWithBeforeAfter.Before(new BeforeRunContext()
                    {RelativeFilePath = "SQLUpsert.cs"});
                }

                return System.Threading.Tasks.Task.CompletedTask;
            }, () =>
            {
                CodedExecutionHelper.Run(() =>
                {
                    {
                        var result = codedWorkflow.Execute(var_dtInsert, var_tableName);
                        newResult = new System.Collections.Generic.Dictionary<string, object>{{"Output", result}};
                    }
                }, cancellationToken);
                return System.Threading.Tasks.Task.FromResult(newResult);
            }, (exception, outArgs) =>
            {
                if (codedWorkflow is IBeforeAfterRun codedWorkflowWithBeforeAfter)
                {
                    codedWorkflowWithBeforeAfter.After(new AfterRunContext()
                    {RelativeFilePath = "SQLUpsert.cs", Exception = exception});
                }

                return System.Threading.Tasks.Task.CompletedTask;
            }), cancellationToken);
            return endContext =>
            {
                Output.Set(endContext, (System.Data.DataTable)result["Output"]);
            };
        }
    }
}