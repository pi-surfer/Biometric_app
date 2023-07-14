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
            'CREATE TABLE IF NOT EXISTS `HR` (`id` INTEGER, `value` INTEGER NOT NULL, `dateTime` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Steps` (`id` INTEGER, `value` INTEGER NOT NULL, `dateTime` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cal` (`id` INTEGER, `value` INTEGER NOT NULL, `dateTime` INTEGER NOT NULL, PRIMARY KEY (`id`))');

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
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _hRUpdateAdapter = UpdateAdapter(
            database,
            'HR',
            ['id'],
            (HR item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _hRDeletionAdapter = DeletionAdapter(
            database,
            'HR',
            ['id'],
            (HR item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HR> _hRInsertionAdapter;

  final UpdateAdapter<HR> _hRUpdateAdapter;

  final DeletionAdapter<HR> _hRDeletionAdapter;

  @override
  Future<List<HR>> findHeartRatesbyDate(
    DateTime startTime,
    DateTime endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM HR WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => HR(row['id'] as int?, row['value'] as int, _dateTimeConverter.decode(row['dateTime'] as int)),
        arguments: [
          _dateTimeConverter.encode(startTime),
          _dateTimeConverter.encode(endTime)
        ]);
  }

  @override
  Future<List<HR>> findAllHeartRates() async {
    return _queryAdapter.queryList('SELECT * FROM HR',
        mapper: (Map<String, Object?> row) => HR(
            row['id'] as int?,
            row['value'] as int,
            _dateTimeConverter.decode(row['dateTime'] as int)));
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
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _stepsUpdateAdapter = UpdateAdapter(
            database,
            'Steps',
            ['id'],
            (Steps item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _stepsDeletionAdapter = DeletionAdapter(
            database,
            'Steps',
            ['id'],
            (Steps item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Steps> _stepsInsertionAdapter;

  final UpdateAdapter<Steps> _stepsUpdateAdapter;

  final DeletionAdapter<Steps> _stepsDeletionAdapter;

  @override
  Future<List<Steps>> findStepsbyDate(
    DateTime startTime,
    DateTime endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM STEPS WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => Steps(row['id'] as int?, row['value'] as int, _dateTimeConverter.decode(row['dateTime'] as int)),
        arguments: [
          _dateTimeConverter.encode(startTime),
          _dateTimeConverter.encode(endTime)
        ]);
  }

  @override
  Future<List<Steps>> findAllSteps() async {
    return _queryAdapter.queryList('SELECT * FROM STEPS',
        mapper: (Map<String, Object?> row) => Steps(
            row['id'] as int?,
            row['value'] as int,
            _dateTimeConverter.decode(row['dateTime'] as int)));
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
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _calUpdateAdapter = UpdateAdapter(
            database,
            'Cal',
            ['id'],
            (Cal item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _calDeletionAdapter = DeletionAdapter(
            database,
            'Cal',
            ['id'],
            (Cal item) => <String, Object?>{
                  'id': item.id,
                  'value': item.value,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cal> _calInsertionAdapter;

  final UpdateAdapter<Cal> _calUpdateAdapter;

  final DeletionAdapter<Cal> _calDeletionAdapter;

  @override
  Future<List<Cal>> findCaloriesbyDate(
    DateTime startTime,
    DateTime endTime,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CALORIES WHERE dateTime between ?1 and ?2 ORDER BY dateTime ASC',
        mapper: (Map<String, Object?> row) => Cal(row['id'] as int?, row['value'] as int, _dateTimeConverter.decode(row['dateTime'] as int)),
        arguments: [
          _dateTimeConverter.encode(startTime),
          _dateTimeConverter.encode(endTime)
        ]);
  }

  @override
  Future<List<Cal>> findAllCalories() async {
    return _queryAdapter.queryList('SELECT * FROM CALORIES',
        mapper: (Map<String, Object?> row) => Cal(
            row['id'] as int?,
            row['value'] as int,
            _dateTimeConverter.decode(row['dateTime'] as int)));
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

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
