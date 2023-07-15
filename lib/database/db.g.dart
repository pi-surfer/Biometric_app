// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseFit {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseFitBuilder databaseBuilder(String name) =>
      _$DatabaseFitBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseFitBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseFitBuilder(null);
}

class _$DatabaseFitBuilder {
  _$DatabaseFitBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseFitBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseFitBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseFit> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseFit();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseFit extends DatabaseFit {
  _$DatabaseFit([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HeartRatesDao? _heartRatesDaoInstance;

  StepsDao? _stepsDaoInstance;

  CaloriesDao? _caloriesDaoInstance;

  TotStepsDao? _totStepsDaoInstance;

  TotCalDao? _totCalDaoInstance;

  AerobicTimeDao? _aerobicTimeDaoInstance;

  DailyScoreDao? _dailyScoreDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HR` (`value` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Steps` (`value` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cal` (`value` REAL NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TotSteps` (`value` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TotCal` (`value` REAL NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AerobicTime` (`value` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DailyScore` (`value` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`dateTime`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HeartRatesDao get heartRatesDao {
    return _heartRatesDaoInstance ??= _$HeartRatesDao(database, changeListener);
  }

  @override
  StepsDao get stepsDao {
    return _stepsDaoInstance ??= _$StepsDao(database, changeListener);
  }

  @override
  CaloriesDao get caloriesDao {
    return _caloriesDaoInstance ??= _$CaloriesDao(database, changeListener);
  }

  @override
  TotStepsDao get totStepsDao {
    return _totStepsDaoInstance ??= _$TotStepsDao(database, changeListener);
  }

  @override
  TotCalDao get totCalDao {
    return _totCalDaoInstance ??= _$TotCalDao(database, changeListener);
  }

  @override
  AerobicTimeDao get aerobicTimeDao {
    return _aerobicTimeDaoInstance ??=
        _$AerobicTimeDao(database, changeListener);
  }

  @override
  DailyScoreDao get dailyScoreDao {
    return _dailyScoreDaoInstance ??= _$DailyScoreDao(database, changeListener);
  }
}

class _$HeartRatesDao extends HeartRatesDao {
  _$HeartRatesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _hRInsertionAdapter = InsertionAdapter(
            database,
            'HR',
            (HR item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _hRUpdateAdapter = UpdateAdapter(
            database,
            'HR',
            ['dateTime'],
            (HR item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _hRDeletionAdapter = DeletionAdapter(
            database,
            'HR',
            ['dateTime'],
            (HR item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HR> _hRInsertionAdapter;

  final UpdateAdapter<HR> _hRUpdateAdapter;

  final DeletionAdapter<HR> _hRDeletionAdapter;

  @override
  Future<List<HR>> findHeartRatesbyDate(
    String startTime,
    String endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM HR WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => HR(row['value'] as int, row['dateTime'] as String),
        arguments: [startTime, endTime]);
  }

  @override
  Future<List<HR>> findAllHeartRates() async {
    return _queryAdapter.queryList('SELECT * FROM HR',
        mapper: (Map<String, Object?> row) =>
            HR(row['value'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> insertHeartRate(HR heartRates) async {
    await _hRInsertionAdapter.insert(heartRates, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateHeartRate(HR heartRates) async {
    await _hRUpdateAdapter.update(heartRates, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteHeartRate(HR heartRates) async {
    await _hRDeletionAdapter.delete(heartRates);
  }
}

class _$StepsDao extends StepsDao {
  _$StepsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _stepsInsertionAdapter = InsertionAdapter(
            database,
            'Steps',
            (Steps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _stepsUpdateAdapter = UpdateAdapter(
            database,
            'Steps',
            ['dateTime'],
            (Steps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _stepsDeletionAdapter = DeletionAdapter(
            database,
            'Steps',
            ['dateTime'],
            (Steps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Steps> _stepsInsertionAdapter;

  final UpdateAdapter<Steps> _stepsUpdateAdapter;

  final DeletionAdapter<Steps> _stepsDeletionAdapter;

  @override
  Future<List<Steps>> findStepsbyDate(
    String startTime,
    String endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM STEPS WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => Steps(row['value'] as int, row['dateTime'] as String),
        arguments: [startTime, endTime]);
  }

  @override
  Future<List<Steps>> findAllSteps() async {
    return _queryAdapter.queryList('SELECT * FROM STEPS',
        mapper: (Map<String, Object?> row) =>
            Steps(row['value'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> insertSteps(Steps steps) async {
    await _stepsInsertionAdapter.insert(steps, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSteps(Steps steps) async {
    await _stepsUpdateAdapter.update(steps, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSteps(Steps steps) async {
    await _stepsDeletionAdapter.delete(steps);
  }
}

class _$CaloriesDao extends CaloriesDao {
  _$CaloriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _calInsertionAdapter = InsertionAdapter(
            database,
            'Cal',
            (Cal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _calUpdateAdapter = UpdateAdapter(
            database,
            'Cal',
            ['dateTime'],
            (Cal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _calDeletionAdapter = DeletionAdapter(
            database,
            'Cal',
            ['dateTime'],
            (Cal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cal> _calInsertionAdapter;

  final UpdateAdapter<Cal> _calUpdateAdapter;

  final DeletionAdapter<Cal> _calDeletionAdapter;

  @override
  Future<List<Cal>> findCaloriesbyDate(
    String startTime,
    String endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CALORIES WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => Cal(row['value'] as double, row['dateTime'] as String),
        arguments: [startTime, endTime]);
  }

  @override
  Future<List<Cal>> findAllCalories() async {
    return _queryAdapter.queryList('SELECT * FROM CALORIES',
        mapper: (Map<String, Object?> row) =>
            Cal(row['value'] as double, row['dateTime'] as String));
  }

  @override
  Future<void> insertCalories(Cal calories) async {
    await _calInsertionAdapter.insert(calories, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCalories(Cal calories) async {
    await _calUpdateAdapter.update(calories, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCalories(Cal calories) async {
    await _calDeletionAdapter.delete(calories);
  }
}

class _$TotStepsDao extends TotStepsDao {
  _$TotStepsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _totStepsInsertionAdapter = InsertionAdapter(
            database,
            'TotSteps',
            (TotSteps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _totStepsUpdateAdapter = UpdateAdapter(
            database,
            'TotSteps',
            ['dateTime'],
            (TotSteps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _totStepsDeletionAdapter = DeletionAdapter(
            database,
            'TotSteps',
            ['dateTime'],
            (TotSteps item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TotSteps> _totStepsInsertionAdapter;

  final UpdateAdapter<TotSteps> _totStepsUpdateAdapter;

  final DeletionAdapter<TotSteps> _totStepsDeletionAdapter;

  @override
  Future<TotSteps?> findTotStepsbyDate(String dateTime) async {
    return _queryAdapter.query('SELECT * FROM TOTALSTEPS AT DAY ?1',
        mapper: (Map<String, Object?> row) =>
            TotSteps(row['value'] as int, row['dateTime'] as String),
        arguments: [dateTime]);
  }

  @override
  Future<List<TotSteps>> findAllTotSteps() async {
    return _queryAdapter.queryList('SELECT * FROM TOTALSTEPS',
        mapper: (Map<String, Object?> row) =>
            TotSteps(row['value'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> insertTotSteps(TotSteps totSteps) async {
    await _totStepsInsertionAdapter.insert(totSteps, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTotSteps(TotSteps totSteps) async {
    await _totStepsUpdateAdapter.update(totSteps, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTotSteps(TotSteps totSteps) async {
    await _totStepsDeletionAdapter.delete(totSteps);
  }
}

class _$TotCalDao extends TotCalDao {
  _$TotCalDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _totCalInsertionAdapter = InsertionAdapter(
            database,
            'TotCal',
            (TotCal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _totCalUpdateAdapter = UpdateAdapter(
            database,
            'TotCal',
            ['dateTime'],
            (TotCal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _totCalDeletionAdapter = DeletionAdapter(
            database,
            'TotCal',
            ['dateTime'],
            (TotCal item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TotCal> _totCalInsertionAdapter;

  final UpdateAdapter<TotCal> _totCalUpdateAdapter;

  final DeletionAdapter<TotCal> _totCalDeletionAdapter;

  @override
  Future<TotCal?> findTotCalbyDate(String dateTime) async {
    return _queryAdapter.query('SELECT * FROM TOTALCALORIES AT DAY ?1',
        mapper: (Map<String, Object?> row) =>
            TotCal(row['value'] as double, row['dateTime'] as String),
        arguments: [dateTime]);
  }

  @override
  Future<List<TotCal>> findAllTotCal() async {
    return _queryAdapter.queryList('SELECT * FROM TOTALCALORIES',
        mapper: (Map<String, Object?> row) =>
            TotCal(row['value'] as double, row['dateTime'] as String));
  }

  @override
  Future<void> insertTotCal(TotCal totCal) async {
    await _totCalInsertionAdapter.insert(totCal, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTotCal(TotCal totCal) async {
    await _totCalUpdateAdapter.update(totCal, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTotCal(TotCal totCal) async {
    await _totCalDeletionAdapter.delete(totCal);
  }
}

class _$AerobicTimeDao extends AerobicTimeDao {
  _$AerobicTimeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _aerobicTimeInsertionAdapter = InsertionAdapter(
            database,
            'AerobicTime',
            (AerobicTime item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _aerobicTimeUpdateAdapter = UpdateAdapter(
            database,
            'AerobicTime',
            ['dateTime'],
            (AerobicTime item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _aerobicTimeDeletionAdapter = DeletionAdapter(
            database,
            'AerobicTime',
            ['dateTime'],
            (AerobicTime item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AerobicTime> _aerobicTimeInsertionAdapter;

  final UpdateAdapter<AerobicTime> _aerobicTimeUpdateAdapter;

  final DeletionAdapter<AerobicTime> _aerobicTimeDeletionAdapter;

  @override
  Future<AerobicTime?> findAerobicTimebyDate(String dateTime) async {
    return _queryAdapter.query('SELECT * FROM AEROBICTIME AT DAY ?1',
        mapper: (Map<String, Object?> row) =>
            AerobicTime(row['value'] as int, row['dateTime'] as String),
        arguments: [dateTime]);
  }

  @override
  Future<List<AerobicTime>> findAllAerobicTime() async {
    return _queryAdapter.queryList('SELECT * FROM AEROBICTIME',
        mapper: (Map<String, Object?> row) =>
            AerobicTime(row['value'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> insertAerobicTime(AerobicTime aerobicTime) async {
    await _aerobicTimeInsertionAdapter.insert(
        aerobicTime, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAerobicTime(AerobicTime aerobicTime) async {
    await _aerobicTimeUpdateAdapter.update(
        aerobicTime, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAerobicTime(AerobicTime aerobicTime) async {
    await _aerobicTimeDeletionAdapter.delete(aerobicTime);
  }
}

class _$DailyScoreDao extends DailyScoreDao {
  _$DailyScoreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _dailyScoreInsertionAdapter = InsertionAdapter(
            database,
            'DailyScore',
            (DailyScore item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _dailyScoreUpdateAdapter = UpdateAdapter(
            database,
            'DailyScore',
            ['dateTime'],
            (DailyScore item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                }),
        _dailyScoreDeletionAdapter = DeletionAdapter(
            database,
            'DailyScore',
            ['dateTime'],
            (DailyScore item) => <String, Object?>{
                  'value': item.value,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DailyScore> _dailyScoreInsertionAdapter;

  final UpdateAdapter<DailyScore> _dailyScoreUpdateAdapter;

  final DeletionAdapter<DailyScore> _dailyScoreDeletionAdapter;

  @override
  Future<DailyScore?> findDailyScorebyDate(String dateTime) async {
    return _queryAdapter.query('SELECT * FROM DAILYSCORE AT DAY ?1',
        mapper: (Map<String, Object?> row) =>
            DailyScore(row['value'] as int, row['dateTime'] as String),
        arguments: [dateTime]);
  }

  @override
  Future<List<DailyScore>> findAllDailyScore() async {
    return _queryAdapter.queryList('SELECT * FROM DAILYSCORE',
        mapper: (Map<String, Object?> row) =>
            DailyScore(row['value'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> insertDailyScore(DailyScore dailyScore) async {
    await _dailyScoreInsertionAdapter.insert(
        dailyScore, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDailyScore(DailyScore dailyScore) async {
    await _dailyScoreUpdateAdapter.update(
        dailyScore, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteDailyScore(DailyScore dailyScore) async {
    await _dailyScoreDeletionAdapter.delete(dailyScore);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
