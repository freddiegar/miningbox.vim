<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
namespace Syntax\Example;

use DateTime;
use DateTimeInterface;
use Exception;
use Syntax\Example\AliasExample as Alias;
use Syntax\Exception\ExampleException;
use Throwable;

interface Syntax
{
    public function one(): void;

    public function two(): string;

    public function three(): int;

    public function four(): float;

    public function five(): bool;

    public function six(): array;

    public function date(): DateTimeInterface;
}

trait SixMethod
{
    public function six(): array
    {
        return [
            'key' => 'value',
        ];
    }

    public function date(): DateTimeInterface
    {
        return new DateTime('now', null);
    }
}

abstract class Highlighting implements Syntax
{
    use SixMethod;

    public function one(): void
    {
    }

    public function two(): string
    {
        return 'Foo';
    }

    public function three(): int
    {
        return 1;
    }

    public function four(): float
    {
        return 1.0;
    }

    public function five(): bool
    {
        return \array_rand([true, false])[0];
    }
}

final class Base extends Highlighting
{
    private int $number;

    private string $foo;

    private bool $flag;

    public function __construct(int $number, string $foo, bool $flag)
    {
        $this->number = $number;
        $this->foo = $foo;
        $this->flag = $flag; // Comment after code
    }

    /*
     * This comment is only to
     * text multiline comments
     */
    public function __destruct()
    {
        // Inline comment
    }
}

class Demo extends Base
{
    public const CONSTANTE = 'CONSTANTE';

    public static function makeStatic()
    {
        return self::factoryStatic();
    }

    public function make()
    {
        return $this->factory();
    }

    public function fakeExample(): \Syxtax\Other\FakeExample
    {
        return new FakeExample;
    }

    public function aliasExample(): Alias
    {
        return new Alias();
    }

    private function factory()
    {
        return new self;
    }

    protected static function factoryStatic()
    {
        return new self;
    }
}

class Test extends \DateTime
{
    private DateTimeInterface $datetime;

    public function setUp(): void
    {
        parent::setUp();

        $this->datetime = new DateTime();
    }

    /**
     * @dataProvider getProvider
     *
     * @param mixed $item
     */
    public function testOne($item): void
    {
        if (isset($item)) {
            $demo = new Demo();
        } else {
            $demo = Demo::makeStatic();
        }

        $this->assertEquals(1, $demo->one());
        $this->assertEquals('Foo', $demo->two());
        $this->assertEquals(1, $demo->three());
        $this->assertEquals(1.0, $demo->four());
        $this->assertEquals(true, $demo->five());
        $this->assertEquals([], $demo->six());
        $this->assertEquals('CONSTANTE', Demo::CONSTANTE);
        $this->assertInstanceOf(Alias::class, $demo->aliasExample());

        try {
            throw new ExampleException;
        } catch (ExampleException $e) {
            die($e->getFile());
        } catch (Exception $e) {
            echo $e->getError();
        } catch (Throwable $e) {
            unset($demo);
        }
    }

    public function getProvider(): array
    {
        return [
            [null],
            [false],
            [true],
            ['single'],
            ["quote's"],
        ];
    }
}
