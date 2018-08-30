Odczyt SMART z dysków.
----
Zestaw skryptów jest przeznaczony do testowania dysków komputerowych w .
Wyniki kolekcjonowane w bazie mysql.


#### Konfiguracja:
1. Wszystkie pliki należy umieścić na jakimś ogólno dostępnym katalogu sieciowym
  * np : ```\\10.4.xx.xxx\wymiana$\checkDisk\```


2. Należy wyedytować plik **checkDisk.ps1**
  * ustawić prawidłowe ścieżki do plików _mysql.exe_ oraz _smartctl.exe_ (parametry _$smartctl_ i _$mysql_).
  * podać prawidłowe dane serwera MySql na który będą trafiały informacje wynikowe (parametry: *$mysql_host*, *$mysql_user*, *$mysql_passw*)


3. **checkDisk.cmd**
  * należy poprawić lokalizacje pliku *checkDisk.ps1* (linia 2)


4. Konfiguracja MySQL
  * Na wybranej bazie mySQL należy wykonać polecenie z pliku *mysql_checkDisk.sql*. Utworzą one tabele oraz strukturę komórek potrzebnych do przechowywania wyników.
  * Dla zapewnienia bezpieczenstwa można stworzyć nowego użytkownika mysql i ograniczyć mu dostęp jedynie do utworzonej tabeli - *checkDisk*.


#### Uruchamianie:
Wystarczy, że uruchomimy ```checkDisk.cmd``` na komputerze z którym chcemy odczytać SMART.
Skrypt jest przystosowany do wykonywania po po sieci (psexec) również w pętli lub przez program RemoteScriptExecutor.


##### Źródła:
* smartctl.exe : https://www.smartmontools.org/
* mysql.exe : https://www.mysql.com/
