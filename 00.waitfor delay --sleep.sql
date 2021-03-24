WHILE (1=1)
BEGIN
	IF EXISTS (SELECT * FROM ##MyTempTable WHERE EventCode = 'Done')
	BEGIN
		BREAK;----'Done' row has finally been inserted and detected, so end this loop
	END
	PRINT N'The other process is not yet done.';-- Reconfirm the non done status to the console.
	WAITFOR DELAY '00:01:30';--Sleep for 90 seconds.
END